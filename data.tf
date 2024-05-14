data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

##############
# Policy
##############
data "aws_iam_policy_document" "allowed_services" {

  dynamic "statement" {
    for_each = toset(local.allowed_services)
    content {
      sid = replace(statement.value, "-", "")

      actions = [
        "${statement.value}:List*",
        "${statement.value}:Get*",
        "${statement.value}:Describe*",
        "${statement.value}:View*",
      ]
      resources = ["*"]
    }
  }
}

data "aws_iam_policy_document" "console_services" {
  count = var.allow_web_console_services ? 1 : 0

  dynamic "statement" {
    for_each = toset(var.web_console_services)
    content {
      sid = replace(statement.value, "-", "")

      actions = [
        "${statement.value}:List*",
        "${statement.value}:Get*",
        "${statement.value}:Describe*",
        "${statement.value}:View*",
      ]
      resources = ["*"]
    }
  }
}

data "aws_iam_policy_document" "sts" {
  count = var.allow_predefined_sts_actions ? 1 : 0

  statement {
    sid = "STS"
    actions = [
      "sts:GetAccessKeyInfo",
      "sts:GetCallerIdentity",
      "sts:GetSessionToken",
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "logs_query" {
  count = var.allow_cloudwatch_logs_query ? 1 : 0

  statement {
    sid = "AllowLogsQuery"
    actions = [
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:FilterLogEvents"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "combined" {
  source_policy_documents = concat(
    [data.aws_iam_policy_document.allowed_services.json],
    data.aws_iam_policy_document.console_services[*].json,
    data.aws_iam_policy_document.sts[*].json,
    data.aws_iam_policy_document.logs_query[*].json,
    [var.policy_json]
  )
}

##############
# Role
##############
data "aws_iam_policy_document" "assume_role" {

  dynamic "statement" {
    # https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/
    for_each = var.allow_self_assume_role ? [1] : []

    content {
      sid     = "ExplicitSelfRoleAssumption"
      effect  = "Allow"
      actions = ["sts:AssumeRole"]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "ArnLike"
        variable = "aws:PrincipalArn"
        values   = ["arn:${local.partition}:iam::${local.account_id}:role${var.role_path}${var.role_name}"]
      }
    }
  }

  # dynamic "statement" {
  #   for_each = local.urls

  #   content {
  #     effect  = "Allow"
  #     actions = ["sts:AssumeRoleWithWebIdentity"]

  #     principals {
  #       type = "Federated"

  #       identifiers = ["arn:${data.aws_partition.current.partition}:iam::${local.aws_account_id}:oidc-provider/${statement.value}"]
  #     }

  #     dynamic "condition" {
  #       for_each = length(var.oidc_fully_qualified_subjects) > 0 ? local.urls : []

  #       content {
  #         test     = "StringEquals"
  #         variable = "${statement.value}:sub"
  #         values   = var.oidc_fully_qualified_subjects
  #       }
  #     }

  #     dynamic "condition" {
  #       for_each = length(var.oidc_subjects_with_wildcards) > 0 ? local.urls : []

  #       content {
  #         test     = "StringLike"
  #         variable = "${statement.value}:sub"
  #         values   = var.oidc_subjects_with_wildcards
  #       }
  #     }

  #     dynamic "condition" {
  #       for_each = length(var.oidc_fully_qualified_audiences) > 0 ? local.urls : []

  #       content {
  #         test     = "StringLike"
  #         variable = "${statement.value}:aud"
  #         values   = var.oidc_fully_qualified_audiences
  #       }
  #     }
  #   }
  # }

  #   dynamic "statement" {
    #     for_each = var.create_role ? [1] : []
    statement {
      effect  = "Allow"
      actions = compact(distinct(concat(["sts:AssumeRole"], var.trusted_role_actions)))

      principals {
        type        = "AWS"
        identifiers = var.trusted_role_arns
      }
      principals {
        type        = "Service"
        identifiers = var.trusted_role_services
      }

      dynamic "condition" {
        for_each = length(local.role_sts_externalid) != 0 ? [true] : []
        content {
            test     = "StringEquals"
            variable = "sts:ExternalId"
            values   = local.role_sts_externalid
        }
      }

      dynamic "condition" {
        for_each = var.role_requires_session_name ? [1] : []
        content {
            test     = "StringEquals"
            variable = "sts:RoleSessionName"
            values   = var.role_session_name
        }
      }

      dynamic "condition" {
        for_each = var.role_requires_mfa ? [1] : []
        content {
          test     = "Bool"
          variable = "aws:MultiFactorAuthPresent"
          values   = ["true"]
        }
      }
      dynamic "condition" {
        for_each = var.role_requires_mfa ? [1] : []
        content {
          test     = "NumericLessThan"
          variable = "aws:MultiFactorAuthAge"
          values   = [var.mfa_age]
        }
      }
    }
  #   }
}


##############
# OIDC 
##############
data "tls_certificate" "this" {
  count = var.create_oidc ? 1 : 0

  url = var.provider_url

  lifecycle {
    precondition {
      condition = var.create_oidc && var.provider_url != ""
      error_message = "The URL of the identity provider is required variable."
    }
  }
}