output "secrets_arns" {
  description = "The ARNs of the created secrets"
  value       = var.init_secrets ? { for k, v in aws_secretsmanager_secret.secret : k => v.arn } : {}
}

locals {
  secret_version = var.init_secrets ? data.aws_secretsmanager_secret_version.secret_version : data.aws_secretsmanager_secret_version.secret_non_init_version
}

output "secrets_version_ids" {
  description = "The version IDs of the created secret versions"
  value       = { for k, v in local.secret_version : k => v.version_id }
}

output "secrets_plaintext" {
  description = "The plaintext values of the created secrets"
  value       = { for k, v in local.secret_version : k => v.secret_string }
  sensitive   = true
}

locals {
  parameter = var.init_parameters ? data.aws_ssm_parameter.parameter :  data.aws_ssm_parameter.parameter_non_init
}

output "parameter_arns" {
  description = "The ARNs of the created parameters"
  value       = { for k, v in local.parameter : k => v.arn }
}

output "parameter_names" {
  description = "The names of the created parameters"
  value       = { for k, v in local.parameter : k => v.name }
}

output "parameter_values" {
  description = "The values of the created parameters"
  value       = { for k, v in local.parameter : k => v.value }
  sensitive   = true
}
