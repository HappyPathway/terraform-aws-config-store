resource "aws_ssm_parameter" "parameter" {
  for_each = var.parameters

  name  = each.value.name
  value = each.value.value
  type  = each.value.type
}

data "aws_ssm_parameter" "lookup" {
  for_each = var.parameters

  depends_on = [
    aws_ssm_parameter.parameter
  ]

  name = each.value.name
}
