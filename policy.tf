locals {
  allowed_services = length(var.allowed_services) != 0 ? distinct(var.allowed_services) : null
}

resource "aws_iam_policy" "policy" {
  count = var.create_policy ? 1 : 0

  name        = var.policy_name
  name_prefix = var.policy_name_prefix
  path        = var.policy_path
  description = var.policy_description

  policy = data.aws_iam_policy_document.combined.json

  tags = merge(
    var.tags,
    var.policy_tags
  )
  
}