resource "aws_secretsmanager_secret" "secret" {
  count = var.init_secrets ? 1 : 0
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  name = each.key
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  count = var.init_secrets ? 1 : 0
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  secret_id     = aws_secretsmanager_secret.secret[each.key].id
  secret_string = each.value.secret_string
}

data "aws_secretsmanager_secret" "secret" {
  count = var.init_secrets ? 1 : 0
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  depends_on = [
    aws_secretsmanager_secret.secret,
    aws_secretsmanager_secret_version.secret_version
  ]

  name = each.key
}

data "aws_secretsmanager_secret_version" "secret_version" {
  count = var.init_secrets ? 1 : 0
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }

  depends_on = [
    aws_secretsmanager_secret.secret,
    aws_secretsmanager_secret_version.secret_version
  ]

  secret_id = data.aws_secretsmanager_secret.lookup[each.key].id
}


data "aws_secretsmanager_secret" "secret_non_init" {
  count = var.init_secrets ? 0 : 1
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }
  name = each.key
}

data "aws_secretsmanager_secret_version" "secret_non_init_version" {
  count = var.init_secrets ? 0 : 1
  for_each = { for s in var.secrets : "${s.path_prefix}/${s.path_key}" => s }
  secret_id = data.aws_secretsmanager_secret.lookup[each.key].id
}
