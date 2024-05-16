##############
# Policy
##############
variable "create_policy" {
  description = "IAM policy 생성 여부"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "policy 이름. create_policy가 true일 경우 필수 값"
  type        = string
  default     = null
}

variable "policy_path" {
  description = "IAM에서 policy 경로 설정"
  type        = string
  default     = "/"
}

variable "policy_description" {
  description = "policy 설명"
  type        = string
  default     = "IAM Policy"
}

variable "tags" {
  description = "모듈 내 모든 리소스에 적용되는 태그"
  type        = map(string)
  default     = {}
}

variable "policy_tags" {
  description = "policy에 추가할 태그"
  type        = map(string)
  default     = {}
}

variable "allowed_services" {
  description = "Get/List/Describe/View을 허용할 서비스를 기입. Service name should be the same as corresponding service IAM prefix. See what it is for each service here https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html"
  type        = list(string)
  default     = []
}

variable "policy_json" {
  description = "(선택사항)? 사용자 지정 JSON policy document"
  type        = string
  default     = "{}"
}

variable "allow_cloudwatch_logs_query" {
  description = "StartQuery/StopQuery/FilterLogEvents CloudWatch actions 허용 여부"
  type        = bool
  default     = false
}

variable "allow_predefined_sts_actions" {
  description = "GetCallerIdentity/GetSessionToken/GetAccessKeyInfo sts actions 허용 여부"
  type        = bool
  default     = false
}

variable "allow_web_console_services" {
  description = "AWS 콘솔 탐색할 때 사용되는 서비스에 대한 List/Get/Describe/View actions 허용 여부 (e.g. resource-groups, tag, health services)"
  type        = bool
  default     = false
}

variable "web_console_services" {
  description = "허용할 웹 콘솔 서비스 List"
  type        = list(string)
  default     = []
  # default     = ["resource-groups", "tag", "health", "ce"]
}

##############
# User
##############
variable "create_user" {
  description = "IAM user 생성 여부"
  type        = bool
  default     = false
}

variable "create_iam_user_login_profile" {
  description = "IAM user login profile 생성 여부"
  type        = bool
  default     = true
}

variable "create_iam_access_key" {
  description = "IAM access key 생성 여부"
  type        = bool
  default     = true
}

variable "user_name" {
  description = "IAM user 이름"
  type        = string
  default     = null
}

variable "user_path" {
  description = "IAM user 경로"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "User 삭제 시 Terraform에서 관리하지 않는 access key, login profile 강제 삭제 여부"
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "(선택사항) base-64로 인코딩된 PGP public key 또는 `keybase:username` 형식의 키베이스 user 이름. 비밀번호와 access key를 암호화하는데 사용"
  type        = string
  default     = ""
}

variable "iam_access_key_status" {
  description = "적용할 access key 상태"
  type        = string
  default     = null
}

variable "password_reset_required" {
  description = "첫 로그인 시 비밀번호 재설정해야 하는지 여부"
  type        = bool
  default     = true
}

variable "password_length" {
  description = "생성된 비밀번호 길이"
  type        = number
  default     = 20
}

variable "upload_iam_user_ssh_key" {
  description = "IAM user에게 public ssh key를 업로드할지 여부"
  type        = bool
  default     = false
}

variable "ssh_key_encoding" {
  description = "응답에 사용할 공개 키 인코딩 형식 지정. ssh-rsa 형식은 SSH, PEM 형식은 PEM으로 작성"
  type        = string
  default     = "SSH"
}

variable "ssh_public_key" {
  description = "SSH 공개 키. ssh-rsa 또는 PEM 형식으로 인코딩해야 함"
  type        = string
  default     = ""
}

variable "permissions_boundary" {
  description = "user에 대한 permissions boundary를 설정하는데 사용되는 정책의 ARN"
  type        = string
  default     = ""
}

variable "policy_arns" {
  description = "IAM user에 직접 할당된 정책의 ARN List"
  type        = list(string)
  default     = []
}

variable "user_tags" {
  description = "user에 추가할 태그"
  type        = map(string)
  default     = {}
}

##############
# Role
##############
variable "trusted_role_actions" {
  description = "추가적인 trusted role actions List"
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
  description = "MFA가 필요한 role에 대한 MFA 최대유효시간 설정"
  type        = number
  default     = 86400
}

variable "max_session_duration" {
  description = "최대 CLI/API 세션 기간 (3600초~43200초)"
  type        = number
  default     = 3600
}

variable "create_role" {
  description = "role 생성 여부"
  type        = bool
  default     = false
}

variable "create_instance_profile" {
  description = "instance profile 생성 여부"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM role 이름"
  type        = string
  default     = null
}

variable "role_path" {
  description = "IAM role 경로"
  type        = string
  default     = "/"
}

variable "role_requires_mfa" {
  description = "role에 MFA 필요 여부"
  type        = bool
  default     = true
}

variable "role_permissions_boundary_arn" {
  description = "IAM role에 사용할 Permissions boundary ARN"
  type        = string
  default     = ""
}

variable "role_tags" {
  description = "role에 추가할 태그"
  type        = map(string)
  default     = {}
}

variable "instance_profile_tags" {
  description = "instance profile role에 추가할 태그"
  type        = map(string)
  default     = {}
}

variable "role_policy_arns" {
  description = "IAM role에 연결할 IAM policy ARN List"
  type        = list(string)
  default     = []
}

variable "custom_role_trust_policy" {
  description = "사용자 지정 role trust policy. create_custom_role_trust_policy이 true인 경우에만 사용"
  type        = string
  default     = ""
}

variable "create_custom_role_trust_policy" {
  description = "custom_role_trust_policy 생성 여부. Prevent errors with count, when custom_role_trust_policy is computed"
  type        = bool
  default     = false
}

variable "force_detach_policies" {
  description = "policy 삭제 시 이 role에서 분리할지 여부"
  type        = bool
  default     = false
}

variable "role_description" {
  description = "IAM Role 설명"
  type        = string
  default     = ""
}

variable "role_sts_externalid" {
  description = "role과 함께 사용할 STS ExternalId 조건 값 (MFA가 필요하지 않는 경우)"
  type        = any
  default     = []
}

variable "allow_self_assume_role" {
  description = "role이 스스로 assume이 되도록 허용할지 여부 (https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/)"
  type        = bool
  default     = false
} 

##############
# Role with OIDC
##############
variable "provider_url" {
  description = "OIDC Provider의 URL 설정. 여러 URL 사용시 provider_urls 변수 사용"
  type        = string
  default     = ""
}

variable "provider_urls" {
  description = "다수의 OIDC Provider URL 설정 List"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  description = "OIDC provider가 있는 AWS 계정 ID로, AWS provider 계정 사용 시 공란 유지"
  type        = string
  default     = ""
}

variable "oidc_fully_qualified_subjects" {
  description = "role policy에 추가할 OIDC subject. 예시) system:serviceaccount:default:sa1"
  type        = set(string)
  default     = []
}

variable "oidc_subjects_with_wildcards" {
  description = "role policy에 추가할 와일드카드를 사용하는 OIDC subject"
  type        = set(string)
  default     = []
}

variable "oidc_fully_qualified_audiences" {
  description = "role policy에 추가할 대상 지정. 계정 간 assumable role의 경우 sts.amazonaws.com으로 설정. 아닌 경우는 빈 값"
  type        = set(string)
  default     = []
}

##############
# Group
##############
variable "create_group" {
  description = "IAM group 생성 여부"
  type        = bool
  default     = false
}
variable "group_name" {
  description = "group의 IAM policy와 IAM group의 이름"
  type        = string
  default     = null
}

variable "group_path" {
  description = "group의 IAM policy와 IAM group 경로"
  type        = string
  default     = "/"
}

variable "custom_group_policies" {
  description = "IAM group에 적용할 list(map(string)) 형태의 IAM policy. name과 policy 키가 무조건 존재해야 함. policy는 json 형태로 넣어야함"
  type        = list(map(string))
  default     = []
}

variable "custom_group_policy_arns" {
  description = "IAM group에 적용할 IAM policy ARN"
  type        = list(string)
  default     = []
}

variable "group_users" {
  description = "IAM group에 넣을 user List"
  type        = list(string)
  default     = []
}

variable "group_tags" {
  description = "group policy에 추가할 태그"
  type        = map(string)
  default     = {}
}

##############
# OIDC
##############
variable "create_oidc" {
  description = "OIDC 생성 여부"
  type        = bool
  default     = false
}

variable "client_id_list" {
  description = "List of client IDs (also known as audiences) for the IAM OIDC provider. Defaults to STS service if not values are provided"
  type        = list(string)
  default     = []
}

variable "thumbprints" {
  description = "List of additional thumbprints to add to the thumbprint list."
  type        = list(string)
  # https://github.blog/changelog/2023-06-27-github-actions-update-on-oidc-integration-with-aws/
  default = []
}

variable "oidc_tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}