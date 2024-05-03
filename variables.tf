##############
# Policy
##############
variable "create_policy" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = null
}

variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = null
}

variable "policy_path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "policy_description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "policy_tags" {
  description = "Additional tags for the policy"
  type        = map(string)
  default     = {}
}

variable "allowed_services" {
  description = "List of services to allow Get/List/Describe/View options. Service name should be the same as corresponding service IAM prefix. See what it is for each service here https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html"
  type        = list(string)
  default     = []
}

variable "policy_json" {
  description = "JSON policy document if you want to add custom actions"
  type        = string
  default     = "{}"
}

variable "allow_cloudwatch_logs_query" {
  description = "Allows StartQuery/StopQuery/FilterLogEvents CloudWatch actions"
  type        = bool
  default     = true
}

variable "allow_predefined_sts_actions" {
  description = "Allows GetCallerIdentity/GetSessionToken/GetAccessKeyInfo sts actions"
  type        = bool
  default     = true
}

variable "allow_web_console_services" {
  description = "Allows List/Get/Describe/View actions for services used when browsing AWS console (e.g. resource-groups, tag, health services)"
  type        = bool
  default     = true
}

variable "web_console_services" {
  description = "List of web console services to allow"
  type        = list(string)
  default     = ["resource-groups", "tag", "health", "ce"]
}

##############
# User
##############
variable "create_user" {
  description = "Whether to create the IAM user"
  type        = bool
  default     = false
}

variable "create_iam_user_login_profile" {
  description = "Whether to create IAM user login profile"
  type        = bool
  default     = true
}

variable "create_iam_access_key" {
  description = "Whether to create IAM access key"
  type        = bool
  default     = true
}

variable "user_name" {
  description = "Desired name for the IAM user"
  type        = string
  default     = null
}

variable "user_path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable "iam_access_key_status" {
  description = "Access key status to apply."
  type        = string
  default     = null
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = true
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "upload_iam_user_ssh_key" {
  description = "Whether to upload a public ssh key to the IAM user"
  type        = bool
  default     = false
}

variable "ssh_key_encoding" {
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM"
  type        = string
  default     = "SSH"
}

variable "ssh_public_key" {
  description = "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format"
  type        = string
  default     = ""
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = ""
}

variable "policy_arns" {
  description = "The list of ARNs of policies directly assigned to the IAM user"
  type        = list(string)
  default     = []
}

variable "user_tags" {
  description = "Additional tags for the user"
  type        = map(string)
  default     = {}
}

##############
# Role
##############
variable "trusted_role_actions" {
  description = "Additional trusted role actions"
  type        = list(string)
  default     = ["sts:AssumeRole", "sts:TagSession"]
}

variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_role_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = []
}

variable "mfa_age" {
  description = "Max age of valid MFA (in seconds) for roles which require MFA"
  type        = number
  default     = 86400
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "create_role" {
  description = "Whether to create a role"
  type        = bool
  default     = false
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "IAM role name prefix"
  type        = string
  default     = null
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "role_requires_mfa" {
  description = "Whether role requires MFA"
  type        = bool
  default     = true
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "role_tags" {
  description = "Additional tags for the role"
  type        = map(string)
  default     = {}
}

variable "instance_profile_tags" {
  description = "Additional tags for the instance profile role"
  type        = map(string)
  default     = {}
}

variable "role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}

variable "custom_role_trust_policy" {
  description = "A custom role trust policy. (Only valid if create_custom_role_trust_policy = true)"
  type        = string
  default     = ""
}

variable "create_custom_role_trust_policy" {
  description = "Whether to create a custom_role_trust_policy. Prevent errors with count, when custom_role_trust_policy is computed"
  type        = bool
  default     = false
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = false
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
  default     = ""
}

variable "role_sts_externalid" {
  description = "STS ExternalId condition values to use with a role (when MFA is not required)"
  type        = any
  default     = []
}

variable "allow_self_assume_role" {
  description = "Determines whether to allow the role to be [assume itself](https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/)"
  type        = bool
  default     = false
}

variable "role_requires_session_name" {
  description = "Determines if the role-session-name variable is needed when assuming a role(https://aws.amazon.com/blogs/security/easily-control-naming-individual-iam-role-sessions/)"
  type        = bool
  default     = false
}

variable "role_session_name" {
  description = "role_session_name for roles which require this parameter when being assumed. By default, you need to set your own username as role_session_name"
  type        = list(string)
  default     = ["$${aws:username}"]
}

##############
# Role with OIDC
##############
variable "provider_url" {
  description = "URL of the OIDC Provider. Use provider_urls to specify several URLs."
  type        = string
  default     = ""
}

variable "provider_urls" {
  description = "List of URLs of the OIDC Providers"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  description = "The AWS account ID where the OIDC provider lives, leave empty to use the account for the AWS provider"
  type        = string
  default     = ""
}

variable "oidc_fully_qualified_subjects" {
  description = "The fully qualified OIDC subjects to be added to the role policy"
  type        = set(string)
  default     = []
}

variable "oidc_subjects_with_wildcards" {
  description = "The OIDC subject using wildcards to be added to the role policy"
  type        = set(string)
  default     = []
}

variable "oidc_fully_qualified_audiences" {
  description = "The audience to be added to the role policy. Set to sts.amazonaws.com for cross-account assumable role. Leave empty otherwise."
  type        = set(string)
  default     = []
}

# EKS
variable "eks_oidc_providers" {
  description = "Map of OIDC providers where each provider map should contain the `provider_arn` and `namespace_service_accounts`"
  type        = any
  default     = {}
}
variable "assume_role_condition_test" {
  description = "Name of the [IAM condition operator](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition_operators.html) to evaluate when assuming the role"
  type        = string
  default     = "StringEquals"
}


##############
# Role with Saml
##############
