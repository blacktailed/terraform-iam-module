<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.27 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Required Inputs
이 변수는 특정 변수가 true일 경우 모듈 블록에 반드시 설정되어야 한다.

**group_name** `[string]`
`create_group` 변수가 true일 경우 반드시 값을 넣어야 한다.

**policy_name** `[string]`
`create_policy` 변수가 true일 경우 반드시 값을 넣어야 한다.

**role_name** `[string]`
`create_role` 변수가 true일 경우 반드시 값을 넣어야 한다.

**user_name** `[string]`
`create_user` 변수가 true일 경우 반드시 값을 넣어야 한다.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.this_no_pgp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.group_arns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_ssh_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_ssh_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.allowed_services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.console_services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.logs_query](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_cloudwatch_logs_query"></a> [allow\_cloudwatch\_logs\_query](#input\_allow\_cloudwatch\_logs\_query) | Allows StartQuery/StopQuery/FilterLogEvents CloudWatch actions | `bool` | `false` | no |
| <a name="input_allow_predefined_sts_actions"></a> [allow\_predefined\_sts\_actions](#input\_allow\_predefined\_sts\_actions) | Allows GetCallerIdentity/GetSessionToken/GetAccessKeyInfo sts actions | `bool` | `false` | no |
| <a name="input_allow_self_assume_role"></a> [allow\_self\_assume\_role](#input\_allow\_self\_assume\_role) | Determines whether to allow the role to be [assume itself](https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/) | `bool` | `false` | no |
| <a name="input_allow_web_console_services"></a> [allow\_web\_console\_services](#input\_allow\_web\_console\_services) | Allows List/Get/Describe/View actions for services used when browsing AWS console (e.g. resource-groups, tag, health services) | `bool` | `false` | no |
| <a name="input_allowed_services"></a> [allowed\_services](#input\_allowed\_services) | List of services to allow Get/List/Describe/View options. Service name should be the same as corresponding service IAM prefix. See what it is for each service here https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html | `list(string)` | `[]` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account ID where the OIDC provider lives, leave empty to use the account for the AWS provider | `string` | `""` | no |
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | List of client IDs (also known as audiences) for the IAM OIDC provider. Defaults to STS service if not values are provided | `list(string)` | `[]` | no |
| <a name="input_create_custom_role_trust_policy"></a> [create\_custom\_role\_trust\_policy](#input\_create\_custom\_role\_trust\_policy) | Whether to create a custom\_role\_trust\_policy. Prevent errors with count, when custom\_role\_trust\_policy is computed | `bool` | `false` | no |
| <a name="input_create_group"></a> [create\_group](#input\_create\_group) | Whether to create IAM group | `bool` | `false` | no |
| <a name="input_create_iam_access_key"></a> [create\_iam\_access\_key](#input\_create\_iam\_access\_key) | Whether to create IAM access key | `bool` | `true` | no |
| <a name="input_create_iam_user_login_profile"></a> [create\_iam\_user\_login\_profile](#input\_create\_iam\_user\_login\_profile) | Whether to create IAM user login profile | `bool` | `true` | no |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Whether to create an instance profile | `bool` | `false` | no |
| <a name="input_create_oidc"></a> [create\_oidc](#input\_create\_oidc) | Controls if resources should be created | `bool` | `false` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Whether to create the IAM policy | `bool` | `false` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create a role | `bool` | `false` | no |
| <a name="input_create_user"></a> [create\_user](#input\_create\_user) | Whether to create the IAM user | `bool` | `false` | no |
| <a name="input_custom_group_policies"></a> [custom\_group\_policies](#input\_custom\_group\_policies) | List of maps of inline IAM policies to attach to IAM group. Should have `name` and `policy` keys in each element. policy는 json으로 넣어야함 ex)data.aws\_iam\_policy\_document.example\_policy.json | `list(map(string))` | `[]` | no |
| <a name="input_custom_group_policy_arns"></a> [custom\_group\_policy\_arns](#input\_custom\_group\_policy\_arns) | List of IAM policies ARNs to attach to IAM group | `list(string)` | `[]` | no |
| <a name="input_custom_role_trust_policy"></a> [custom\_role\_trust\_policy](#input\_custom\_role\_trust\_policy) | A custom role trust policy. (Only valid if create\_custom\_role\_trust\_policy = true) | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force\_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | `bool` | `false` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Whether policies should be detached from this role when destroying | `bool` | `false` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Name of IAM policy and IAM group | `string` | `null` | yes |
| <a name="input_group_path"></a> [group\_path](#input\_group\_path) | Path of IAM policy and IAM group | `string` | `"/"` | no |
| <a name="input_group_tags"></a> [group\_tags](#input\_group\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_group_users"></a> [group\_users](#input\_group\_users) | List of IAM users to have in an IAM group which can assume the role | `list(string)` | `[]` | no |
| <a name="input_iam_access_key_status"></a> [iam\_access\_key\_status](#input\_iam\_access\_key\_status) | Access key status to apply. | `string` | `null` | no |
| <a name="input_instance_profile_tags"></a> [instance\_profile\_tags](#input\_instance\_profile\_tags) | Additional tags for the instance profile role | `map(string)` | `{}` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `3600` | no |
| <a name="input_mfa_age"></a> [mfa\_age](#input\_mfa\_age) | Max age of valid MFA (in seconds) for roles which require MFA | `number` | `86400` | no |
| <a name="input_oidc_fully_qualified_audiences"></a> [oidc\_fully\_qualified\_audiences](#input\_oidc\_fully\_qualified\_audiences) | The audience to be added to the role policy. Set to sts.amazonaws.com for cross-account assumable role. Leave empty otherwise. | `set(string)` | `[]` | no |
| <a name="input_oidc_fully_qualified_subjects"></a> [oidc\_fully\_qualified\_subjects](#input\_oidc\_fully\_qualified\_subjects) | The fully qualified OIDC subjects to be added to the role policy | `set(string)` | `[]` | no |
| <a name="input_oidc_subjects_with_wildcards"></a> [oidc\_subjects\_with\_wildcards](#input\_oidc\_subjects\_with\_wildcards) | The OIDC subject using wildcards to be added to the role policy | `set(string)` | `[]` | no |
| <a name="input_oidc_tags"></a> [oidc\_tags](#input\_oidc\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | The length of the generated password | `number` | `20` | no |
| <a name="input_password_reset_required"></a> [password\_reset\_required](#input\_password\_reset\_required) | Whether the user should be forced to reset the generated password on first login. | `bool` | `true` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the user. | `string` | `""` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. | `string` | `""` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | The list of ARNs of policies directly assigned to the IAM user | `list(string)` | `[]` | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | The description of the policy | `string` | `"IAM Policy"` | no |
| <a name="input_policy_json"></a> [policy\_json](#input\_policy\_json) | JSON policy document if you want to add custom actions | `string` | `"{}"` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the policy | `string` | `null` | yes |
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | The path of the policy in IAM | `string` | `"/"` | no |
| <a name="input_policy_tags"></a> [policy\_tags](#input\_policy\_tags) | Additional tags for the policy | `map(string)` | `{}` | no |
| <a name="input_provider_url"></a> [provider\_url](#input\_provider\_url) | URL of the OIDC Provider. Use provider\_urls to specify several URLs. | `string` | `""` | yes |
| <a name="input_provider_urls"></a> [provider\_urls](#input\_provider\_urls) | List of URLs of the OIDC Providers | `list(string)` | `[]` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM Role description | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role name | `string` | `null` | yes |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `""` | no |
| <a name="input_role_policy_arns"></a> [role\_policy\_arns](#input\_role\_policy\_arns) | List of ARNs of IAM policies to attach to IAM role | `list(string)` | `[]` | no |
| <a name="input_role_requires_mfa"></a> [role\_requires\_mfa](#input\_role\_requires\_mfa) | Whether role requires MFA | `bool` | `true` | no |
| <a name="input_role_requires_session_name"></a> [role\_requires\_session\_name](#input\_role\_requires\_session\_name) | Determines if the role-session-name variable is needed when assuming a role(https://aws.amazon.com/blogs/security/easily-control-naming-individual-iam-role-sessions/) | `bool` | `false` | no |
| <a name="input_role_session_name"></a> [role\_session\_name](#input\_role\_session\_name) | role\_session\_name for roles which require this parameter when being assumed. By default, you need to set your own username as role\_session\_name | `list(string)` | <pre>[<br>  "${aws:username}"<br>]</pre> | no |
| <a name="input_role_sts_externalid"></a> [role\_sts\_externalid](#input\_role\_sts\_externalid) | STS ExternalId condition values to use with a role (when MFA is not required) | `any` | `[]` | no |
| <a name="input_role_tags"></a> [role\_tags](#input\_role\_tags) | Additional tags for the role | `map(string)` | `{}` | no |
| <a name="input_ssh_key_encoding"></a> [ssh\_key\_encoding](#input\_ssh\_key\_encoding) | Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM | `string` | `"SSH"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | The SSH public key. The public key must be encoded in ssh-rsa format or PEM format | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_thumbprints"></a> [thumbprints](#input\_thumbprints) | List of additional thumbprints to add to the thumbprint list. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_actions"></a> [trusted\_role\_actions](#input\_trusted\_role\_actions) | Additional trusted role actions | `list(string)` | <pre>[<br>  "sts:AssumeRole",<br>  "sts:TagSession"<br>]</pre> | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | AWS Services that can assume these roles | `list(string)` | `[]` | no |
| <a name="input_upload_iam_user_ssh_key"></a> [upload\_iam\_user\_ssh\_key](#input\_upload\_iam\_user\_ssh\_key) | Whether to upload a public ssh key to the IAM user | `bool` | `false` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Desired name for the IAM user | `string` | `null` | yes |
| <a name="input_user_path"></a> [user\_path](#input\_user\_path) | Desired path for the IAM user | `string` | `"/"` | no |
| <a name="input_user_tags"></a> [user\_tags](#input\_user\_tags) | Additional tags for the user | `map(string)` | `{}` | no |
| <a name="input_web_console_services"></a> [web\_console\_services](#input\_web\_console\_services) | List of web console services to allow | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_arn"></a> [group\_arn](#output\_group\_arn) | IAM group arn |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | IAM group name |
| <a name="output_group_users"></a> [group\_users](#output\_group\_users) | List of IAM users in IAM group |
| <a name="output_iam_access_key_encrypted_secret"></a> [iam\_access\_key\_encrypted\_secret](#output\_iam\_access\_key\_encrypted\_secret) | The encrypted secret, base64 encoded |
| <a name="output_iam_access_key_encrypted_ses_smtp_password_v4"></a> [iam\_access\_key\_encrypted\_ses\_smtp\_password\_v4](#output\_iam\_access\_key\_encrypted\_ses\_smtp\_password\_v4) | The encrypted secret access key converted into an SES SMTP password by applying AWS's Sigv4 conversion algorithm |
| <a name="output_iam_access_key_id"></a> [iam\_access\_key\_id](#output\_iam\_access\_key\_id) | The access key ID |
| <a name="output_iam_access_key_key_fingerprint"></a> [iam\_access\_key\_key\_fingerprint](#output\_iam\_access\_key\_key\_fingerprint) | The fingerprint of the PGP key used to encrypt the secret |
| <a name="output_iam_access_key_secret"></a> [iam\_access\_key\_secret](#output\_iam\_access\_key\_secret) | The access key secret |
| <a name="output_iam_access_key_ses_smtp_password_v4"></a> [iam\_access\_key\_ses\_smtp\_password\_v4](#output\_iam\_access\_key\_ses\_smtp\_password\_v4) | The secret access key converted into an SES SMTP password by applying AWS's Sigv4 conversion algorithm |
| <a name="output_iam_access_key_status"></a> [iam\_access\_key\_status](#output\_iam\_access\_key\_status) | Active or Inactive. Keys are initially active, but can be made inactive by other means. |
| <a name="output_iam_instance_profile_arn"></a> [iam\_instance\_profile\_arn](#output\_iam\_instance\_profile\_arn) | ARN of IAM instance profile |
| <a name="output_iam_instance_profile_id"></a> [iam\_instance\_profile\_id](#output\_iam\_instance\_profile\_id) | IAM Instance profile's ID. |
| <a name="output_iam_instance_profile_name"></a> [iam\_instance\_profile\_name](#output\_iam\_instance\_profile\_name) | Name of IAM instance profile |
| <a name="output_iam_instance_profile_path"></a> [iam\_instance\_profile\_path](#output\_iam\_instance\_profile\_path) | Path of IAM instance profile |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | The ARN assigned by AWS for this user |
| <a name="output_iam_user_login_profile_encrypted_password"></a> [iam\_user\_login\_profile\_encrypted\_password](#output\_iam\_user\_login\_profile\_encrypted\_password) | The encrypted password, base64 encoded |
| <a name="output_iam_user_login_profile_key_fingerprint"></a> [iam\_user\_login\_profile\_key\_fingerprint](#output\_iam\_user\_login\_profile\_key\_fingerprint) | The fingerprint of the PGP key used to encrypt the password |
| <a name="output_iam_user_login_profile_password"></a> [iam\_user\_login\_profile\_password](#output\_iam\_user\_login\_profile\_password) | The user password |
| <a name="output_iam_user_name"></a> [iam\_user\_name](#output\_iam\_user\_name) | The user's name |
| <a name="output_iam_user_ssh_key_fingerprint"></a> [iam\_user\_ssh\_key\_fingerprint](#output\_iam\_user\_ssh\_key\_fingerprint) | The MD5 message digest of the SSH public key |
| <a name="output_iam_user_ssh_key_ssh_public_key_id"></a> [iam\_user\_ssh\_key\_ssh\_public\_key\_id](#output\_iam\_user\_ssh\_key\_ssh\_public\_key\_id) | The unique identifier for the SSH public key |
| <a name="output_iam_user_unique_id"></a> [iam\_user\_unique\_id](#output\_iam\_user\_unique\_id) | The unique ID assigned by AWS |
| <a name="output_keybase_password_decrypt_command"></a> [keybase\_password\_decrypt\_command](#output\_keybase\_password\_decrypt\_command) | Decrypt user password command |
| <a name="output_keybase_password_pgp_message"></a> [keybase\_password\_pgp\_message](#output\_keybase\_password\_pgp\_message) | Encrypted password |
| <a name="output_keybase_secret_key_decrypt_command"></a> [keybase\_secret\_key\_decrypt\_command](#output\_keybase\_secret\_key\_decrypt\_command) | Decrypt access secret key command |
| <a name="output_keybase_secret_key_pgp_message"></a> [keybase\_secret\_key\_pgp\_message](#output\_keybase\_secret\_key\_pgp\_message) | Encrypted access secret key |
| <a name="output_keybase_ses_smtp_password_v4_decrypt_command"></a> [keybase\_ses\_smtp\_password\_v4\_decrypt\_command](#output\_keybase\_ses\_smtp\_password\_v4\_decrypt\_command) | Decrypt SES SMTP password command |
| <a name="output_keybase_ses_smtp_password_v4_pgp_message"></a> [keybase\_ses\_smtp\_password\_v4\_pgp\_message](#output\_keybase\_ses\_smtp\_password\_v4\_pgp\_message) | Encrypted SES SMTP password |
| <a name="output_pgp_key"></a> [pgp\_key](#output\_pgp\_key) | PGP key used to encrypt sensitive data for this user (if empty - secrets are not encrypted) |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_policy_arns"></a> [policy\_arns](#output\_policy\_arns) | The list of ARNs of policies directly assigned to the IAM user |
| <a name="output_policy_description"></a> [policy\_description](#output\_policy\_description) | The description of the policy |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The policy's ID |
| <a name="output_policy_json"></a> [policy\_json](#output\_policy\_json) | Policy document as json. Useful if you need document but do not want to create IAM policy itself. For example for SSO Permission Set inline policies |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy |
| <a name="output_policy_path"></a> [policy\_path](#output\_policy\_path) | The path of the policy in IAM |
| <a name="output_role_requires_mfa"></a> [role\_requires\_mfa](#output\_role\_requires\_mfa) | Whether IAM role requires MFA |
| <a name="output_role_sts_externalid"></a> [role\_sts\_externalid](#output\_role\_sts\_externalid) | STS ExternalId condition value to use with a role |
<!-- END_TF_DOCS -->
