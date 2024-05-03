data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  account_id                         = data.aws_caller_identity.current.account_id
  aws_account_id = var.aws_account_id != "" ? var.aws_account_id : data.aws_caller_identity.current.account_id
  partition                          = data.aws_partition.current.partition
  role_sts_externalid                = flatten([var.role_sts_externalid])
  role_name_condition                = var.role_name != null ? var.role_name : (var.create_role ? "${var.role_name_prefix}*" : "")
  custom_role_trust_policy_condition = var.create_custom_role_trust_policy ? var.custom_role_trust_policy : ""
  # clean URLs of https:// prefix
  urls = [
    for url in compact(distinct(concat(var.provider_urls, [var.provider_url]))) :
    replace(url, "https://", "")
  ]
}

resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0

  name                 = var.role_name
  name_prefix          = var.role_name_prefix
  path                 = var.role_path
  max_session_duration = var.max_session_duration
  description          = var.role_description

  force_detach_policies = var.force_detach_policies
  permissions_boundary  = var.role_permissions_boundary_arn

#   assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
  assume_role_policy = coalesce(
    local.custom_role_trust_policy_condition,
    data.aws_iam_policy_document.assume_role[0].json,
  )
#   assume_role_policy = coalesce(
#     local.custom_role_trust_policy_condition,
#     try(data.aws_iam_policy_document.assume_role_with_mfa[0].json,
#       data.aws_iam_policy_document.assume_role[0].json
#     )
#   )

  tags = merge(
    var.tags,
    var.role_tags
  )
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = var.create_role ? length(var.role_policy_arns) : 0

  role       = aws_iam_role.this[0].name
  policy_arn = element(var.role_policy_arns, count.index)
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_role && var.create_instance_profile ? 1 : 0
  name  = var.role_name
  path  = var.role_path
  role  = aws_iam_role.this[0].name

  tags = merge(
    var.tags,
    var.instance_profile_tags
  )
}