# module "test_user" {
#     source = "./module"
#     create_user = true
#     user_name = "hklee-test"
# }

# module "test_role" {
#   source = "./module"
  
  #########################
  # mfa = true, create role, role policy는 필수
  #########################
#   create_role = true
#   role_name = "testrole"
#   trusted_role_arns = [
#     # module.test_user.iam_role_arn
#     "arn:aws:iam::145536406580:root"
#   ]
#   trusted_role_services = [
#     "codedeploy.amazonaws.com"
#   ]
#   role_policy_arns = [ "arn:aws:iam::aws:policy/AdministratorAccess" ]

  #########################
  # mfa = true, create role, role policy는 필수, allow_self_assume_role = true
  #########################
#   allow_self_assume_role = true
#   create_role = true
#   role_name = "testrole"
#   trusted_role_arns = [
#     # module.test_user.iam_role_arn
#     "arn:aws:iam::145536406580:root"
#   ]
#   trusted_role_services = [
#     "codedeploy.amazonaws.com"
#   ]
#   role_policy_arns = [ "arn:aws:iam::aws:policy/AdministratorAccess" ]
  
  #########################
  # mfa = false, create role
  #########################
#   create_role = true
#   trusted_role_arns = [
#     # module.test_user.iam_role_arn
#     "arn:aws:iam::145536406580:root"
#   ]

#   role_name_prefix  = "custom-"
#   role_requires_mfa = false

#   role_sts_externalid = "some-id-goes-here"

#   role_policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
#     "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess"
#   ]

  #########################
  # mfa = true, create role with multi sts
  #########################
#   trusted_role_arns = [
#     # module.test_user.iam_role_arn
#     "arn:aws:iam::145536406580:root"
#   ]

#   trusted_role_services = [
#     "codedeploy.amazonaws.com"
#   ]

#   create_role = true

#   role_name         = "custom_sts"

#   role_sts_externalid = [
#     "some-id-goes-here",
#     "another-id-goes-here",
#   ]

#   role_policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
#     "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess",
#   ]

  #########################
  # mfa = true, create role with custom trust policy
  #########################
#   create_role = true

#   role_name = "iam_assumable_role_custom_trust_policy"

#   create_custom_role_trust_policy = true
#   custom_role_trust_policy        = data.aws_iam_policy_document.custom_trust_policy.json
#   role_policy_arns         = ["arn:aws:iam::aws:policy/AmazonCognitoReadOnly"]

# }

data "aws_iam_policy_document" "custom_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["some-ext-id"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = ["o-someorgid"]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}


module "test_policy" {
  source = "./module"
  create_policy = true
  
}