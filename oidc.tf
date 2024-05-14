resource "aws_iam_openid_connect_provider" "this" {
  count = var.create_oidc ? 1 : 0

  url             = var.provider_url
  client_id_list  = coalescelist(var.client_id_list, ["sts.${data.aws_partition.current.dns_suffix}"])
  thumbprint_list = distinct(concat(data.tls_certificate.this[0].certificates[*].sha1_fingerprint, var.thumbprints))

  tags = merge(
    var.tags,
    var.oidc_tags
  )
  lifecycle {
    precondition {
      condition = var.create_oidc && var.provider_url != ""
      error_message = "The URL of the identity provider is required variable."
    }
  }
}