resource "aws_secretsmanager_secret" "secret" {
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  name = each.key
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = each.value.secret_string
}

data "aws_secretsmanager_secret" "lookup" {
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  depends_on = [
    aws_secretsmanager_secret.secret,
    aws_secretsmanager_secret_version.secret_version
  ]

  name = each.key
}

data "aws_secretsmanager_secret_version" "lookup_version" {
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  depends_on = [
    aws_secretsmanager_secret.secret,
    aws_secretsmanager_secret_version.secret_version
  ]

  secret_id = data.aws_secretsmanager_secret.lookup[each.key].id
}
