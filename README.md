<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.27 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

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
| <a name="input_allow_cloudwatch_logs_query"></a> [allow\_cloudwatch\_logs\_query](#input\_allow\_cloudwatch\_logs\_query) | StartQuery/StopQuery/FilterLogEvents CloudWatch actions 허용 여부 | `bool` | `false` | no |
| <a name="input_allow_predefined_sts_actions"></a> [allow\_predefined\_sts\_actions](#input\_allow\_predefined\_sts\_actions) | GetCallerIdentity/GetSessionToken/GetAccessKeyInfo sts actions 허용 여부 | `bool` | `false` | no |
| <a name="input_allow_self_assume_role"></a> [allow\_self\_assume\_role](#input\_allow\_self\_assume\_role) | role이 스스로 assume이 되도록 허용할지 여부 (https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/) | `bool` | `false` | no |
| <a name="input_allow_web_console_services"></a> [allow\_web\_console\_services](#input\_allow\_web\_console\_services) | AWS 콘솔 탐색할 때 사용되는 서비스에 대한 List/Get/Describe/View actions 허용 여부 (e.g. resource-groups, tag, health services) | `bool` | `false` | no |
| <a name="input_allowed_services"></a> [allowed\_services](#input\_allowed\_services) | Get/List/Describe/View을 허용할 서비스를 기입. Service name should be the same as corresponding service IAM prefix. See what it is for each service here https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html | `list(string)` | `[]` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | OIDC provider가 있는 AWS 계정 ID로, AWS provider 계정 사용 시 공란 유지 | `string` | `""` | no |
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | List of client IDs (also known as audiences) for the IAM OIDC provider. Defaults to STS service if not values are provided | `list(string)` | `[]` | no |
| <a name="input_create_custom_role_trust_policy"></a> [create\_custom\_role\_trust\_policy](#input\_create\_custom\_role\_trust\_policy) | custom\_role\_trust\_policy 생성 여부. Prevent errors with count, when custom\_role\_trust\_policy is computed | `bool` | `false` | no |
| <a name="input_create_group"></a> [create\_group](#input\_create\_group) | IAM group 생성 여부 | `bool` | `false` | no |
| <a name="input_create_iam_access_key"></a> [create\_iam\_access\_key](#input\_create\_iam\_access\_key) | IAM access key 생성 여부 | `bool` | `true` | no |
| <a name="input_create_iam_user_login_profile"></a> [create\_iam\_user\_login\_profile](#input\_create\_iam\_user\_login\_profile) | IAM user login profile 생성 여부 | `bool` | `true` | no |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | instance profile 생성 여부 | `bool` | `false` | no |
| <a name="input_create_oidc"></a> [create\_oidc](#input\_create\_oidc) | OIDC 생성 여부 | `bool` | `false` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | IAM policy 생성 여부 | `bool` | `false` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | role 생성 여부 | `bool` | `false` | no |
| <a name="input_create_user"></a> [create\_user](#input\_create\_user) | IAM user 생성 여부 | `bool` | `false` | no |
| <a name="input_custom_group_policies"></a> [custom\_group\_policies](#input\_custom\_group\_policies) | IAM group에 적용할 list(map(string)) 형태의 IAM policy. name과 policy 키가 무조건 존재해야 함. policy는 json 형태로 넣어야함 | `list(map(string))` | `[]` | no |
| <a name="input_custom_group_policy_arns"></a> [custom\_group\_policy\_arns](#input\_custom\_group\_policy\_arns) | IAM group에 적용할 IAM policy ARN | `list(string)` | `[]` | no |
| <a name="input_custom_role_trust_policy"></a> [custom\_role\_trust\_policy](#input\_custom\_role\_trust\_policy) | 사용자 지정 role trust policy. create\_custom\_role\_trust\_policy이 true인 경우에만 사용 | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | User 삭제 시 Terraform에서 관리하지 않는 access key, login profile 강제 삭제 여부 | `bool` | `false` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | policy 삭제 시 이 role에서 분리할지 여부 | `bool` | `false` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | group의 IAM policy와 IAM group의 이름 | `string` | `null` | no |
| <a name="input_group_path"></a> [group\_path](#input\_group\_path) | group의 IAM policy와 IAM group 경로 | `string` | `"/"` | no |
| <a name="input_group_tags"></a> [group\_tags](#input\_group\_tags) | group policy에 추가할 태그 | `map(string)` | `{}` | no |
| <a name="input_group_users"></a> [group\_users](#input\_group\_users) | IAM group에 넣을 user List | `list(string)` | `[]` | no |
| <a name="input_iam_access_key_status"></a> [iam\_access\_key\_status](#input\_iam\_access\_key\_status) | 적용할 access key 상태 | `string` | `null` | no |
| <a name="input_instance_profile_tags"></a> [instance\_profile\_tags](#input\_instance\_profile\_tags) | instance profile role에 추가할 태그 | `map(string)` | `{}` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | 최대 CLI/API 세션 기간 (3600초~43200초) | `number` | `3600` | no |
| <a name="input_mfa_age"></a> [mfa\_age](#input\_mfa\_age) | MFA가 필요한 role에 대한 MFA 최대유효시간 설정 | `number` | `86400` | no |
| <a name="input_oidc_fully_qualified_audiences"></a> [oidc\_fully\_qualified\_audiences](#input\_oidc\_fully\_qualified\_audiences) | role policy에 추가할 대상 지정. 계정 간 assumable role의 경우 sts.amazonaws.com으로 설정. 아닌 경우는 빈 값 | `set(string)` | `[]` | no |
| <a name="input_oidc_fully_qualified_subjects"></a> [oidc\_fully\_qualified\_subjects](#input\_oidc\_fully\_qualified\_subjects) | role policy에 추가할 OIDC subject. 예시) system:serviceaccount:default:sa1 | `set(string)` | `[]` | no |
| <a name="input_oidc_subjects_with_wildcards"></a> [oidc\_subjects\_with\_wildcards](#input\_oidc\_subjects\_with\_wildcards) | role policy에 추가할 와일드카드를 사용하는 OIDC subject | `set(string)` | `[]` | no |
| <a name="input_oidc_tags"></a> [oidc\_tags](#input\_oidc\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | 생성된 비밀번호 길이 | `number` | `20` | no |
| <a name="input_password_reset_required"></a> [password\_reset\_required](#input\_password\_reset\_required) | 첫 로그인 시 비밀번호 재설정해야 하는지 여부 | `bool` | `true` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | user에 대한 permissions boundary를 설정하는데 사용되는 정책의 ARN | `string` | `""` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | (선택사항) base-64로 인코딩된 PGP public key 또는 `keybase:username` 형식의 키베이스 user 이름. 비밀번호와 access key를 암호화하는데 사용 | `string` | `""` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | IAM user에 직접 할당된 정책의 ARN List | `list(string)` | `[]` | no |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | policy 설명 | `string` | `"IAM Policy"` | no |
| <a name="input_policy_json"></a> [policy\_json](#input\_policy\_json) | (선택사항)? 사용자 지정 JSON policy document | `string` | `"{}"` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | policy 이름. create\_policy가 true일 경우 필수 값 | `string` | `null` | no |
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | IAM에서 policy 경로 설정 | `string` | `"/"` | no |
| <a name="input_policy_tags"></a> [policy\_tags](#input\_policy\_tags) | policy에 추가할 태그 | `map(string)` | `{}` | no |
| <a name="input_provider_url"></a> [provider\_url](#input\_provider\_url) | OIDC Provider의 URL 설정. 여러 URL 사용시 provider\_urls 변수 사용 | `string` | `""` | no |
| <a name="input_provider_urls"></a> [provider\_urls](#input\_provider\_urls) | 다수의 OIDC Provider URL 설정 List | `list(string)` | `[]` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM Role 설명 | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role 이름 | `string` | `null` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | IAM role 경로 | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | IAM role에 사용할 Permissions boundary ARN | `string` | `""` | no |
| <a name="input_role_policy_arns"></a> [role\_policy\_arns](#input\_role\_policy\_arns) | IAM role에 연결할 IAM policy ARN List | `list(string)` | `[]` | no |
| <a name="input_role_requires_mfa"></a> [role\_requires\_mfa](#input\_role\_requires\_mfa) | role에 MFA 필요 여부 | `bool` | `true` | no |
| <a name="input_role_sts_externalid"></a> [role\_sts\_externalid](#input\_role\_sts\_externalid) | role과 함께 사용할 STS ExternalId 조건 값 (MFA가 필요하지 않는 경우) | `any` | `[]` | no |
| <a name="input_role_tags"></a> [role\_tags](#input\_role\_tags) | role에 추가할 태그 | `map(string)` | `{}` | no |
| <a name="input_ssh_key_encoding"></a> [ssh\_key\_encoding](#input\_ssh\_key\_encoding) | 응답에 사용할 공개 키 인코딩 형식 지정. ssh-rsa 형식은 SSH, PEM 형식은 PEM으로 작성 | `string` | `"SSH"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH 공개 키. ssh-rsa 또는 PEM 형식으로 인코딩해야 함 | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | 모듈 내 모든 리소스에 적용되는 태그 | `map(string)` | `{}` | no |
| <a name="input_thumbprints"></a> [thumbprints](#input\_thumbprints) | List of additional thumbprints to add to the thumbprint list. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_actions"></a> [trusted\_role\_actions](#input\_trusted\_role\_actions) | 추가적인 trusted role actions List | `list(string)` | <pre>[<br>  "sts:AssumeRole",<br>  "sts:TagSession"<br>]</pre> | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | AWS Services that can assume these roles | `list(string)` | `[]` | no |
| <a name="input_upload_iam_user_ssh_key"></a> [upload\_iam\_user\_ssh\_key](#input\_upload\_iam\_user\_ssh\_key) | IAM user에게 public ssh key를 업로드할지 여부 | `bool` | `false` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | IAM user 이름 | `string` | `null` | no |
| <a name="input_user_path"></a> [user\_path](#input\_user\_path) | IAM user 경로 | `string` | `"/"` | no |
| <a name="input_user_tags"></a> [user\_tags](#input\_user\_tags) | user에 추가할 태그 | `map(string)` | `{}` | no |
| <a name="input_web_console_services"></a> [web\_console\_services](#input\_web\_console\_services) | 허용할 웹 콘솔 서비스 List | `list(string)` | `[]` | no |

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