locals {
  allowed_services = length(var.allowed_services) != 0 ? distinct(var.allowed_services) : []
}

resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description

  policy = data.aws_iam_policy_document.combined.json

  tags = merge(
    var.tags,
    var.policy_tags
  )

  lifecycle {
    precondition {
      condition = var.create_policy && var.policy_name != null
      error_message = "policy name is required variable."
    }
  }
  
}

resource "aws_iam_policy" "group" {
  count = length(var.custom_group_policies)

  name        = var.custom_group_policies[count.index]["name"]
  policy      = var.custom_group_policies[count.index]["policy"]
  description = lookup(var.custom_group_policies[count.index], "description", null)

  tags = merge(
    var.tags,
    var.group_tags
  )
}
