output "secrets_arns" {
  description = "The ARNs of the created secrets"
  value       = { for k, v in aws_secretsmanager_secret.secret : k => v.arn }
}

output "secrets_version_ids" {
  description = "The version IDs of the created secret versions"
  value       = { for k, v in aws_secretsmanager_secret_version.secret_version : k => v.version_id }
}


output "secrets_plaintext" {
  description = "The plaintext values of the created secrets"
  value       = { for k, v in data.aws_secretsmanager_secret_version.lookup_version : k => v.secret_string }
  sensitive   = true
}

output "parameter_arns" {
  description = "The ARNs of the created parameters"
  value       = { for k, v in aws_ssm_parameter.parameter : k => v.arn }
}

output "parameter_names" {
  description = "The names of the created parameters"
  value       = { for k, v in aws_ssm_parameter.parameter : k => v.name }
}

output "parameter_values" {
  description = "The values of the created parameters"
  value       = { for k, v in data.aws_ssm_parameter.parameter : k => v.value }
  sensitive   = true
}
