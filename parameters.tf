resource "aws_ssm_parameter" "parameter" {
  for_each = var.init_parameters ? tomap({ for param in var.parameters : (param.name) => param }) : {}

  name  = each.value.name
  value = each.value.value
  type  = each.value.type
}

data "aws_ssm_parameter" "parameter" {
  for_each = var.init_parameters ? tomap({ for param in var.parameters : (param.name) => param }) : {}

  depends_on = [
    aws_ssm_parameter.parameter
  ]

  name = each.value.name
}


data "aws_ssm_parameter" "parameter_non_init" {
  for_each = var.init_parameters ? {} : tomap({ for param in var.parameters : (param.name) => param })
  name     = each.value.name
}
