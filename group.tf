locals {
  group_name = var.create_group ? aws_iam_group.this[0].id : var.group_name
}

resource "aws_iam_group" "this" {
  count = var.create_group ? 1 : 0
  name = var.group_name
  path = var.group_path

  lifecycle {
    precondition {
      condition = var.create_group && var.group_name != null
      error_message = "group name is required variable."
    }
  }
}

resource "aws_iam_group_membership" "this" {
  count = length(var.group_users) > 0 ? 1 : 0

  group = local.group_name
  name  = var.group_name
  users = var.group_users
}

resource "aws_iam_group_policy_attachment" "this" {
  count      = var.create_group ? length(var.custom_group_policies) : 0
  group      = local.group_name
  policy_arn = element(aws_iam_policy.group[*].arn, count.index)
}

resource "aws_iam_group_policy_attachment" "group_arns" {
  count      = length(var.custom_group_policy_arns)

  group      = local.group_name
  policy_arn = element(var.custom_group_policy_arns, count.index)
}