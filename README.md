
[![Terraform Validation](https://github.com/HappyPathway/terraform-aws-config-store/actions/workflows/terraform.yaml/badge.svg)](https://github.com/HappyPathway/terraform-aws-config-store/actions/workflows/terraform.yaml)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_ssm_parameter.parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret.secret_non_init](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.secret_non_init_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_secretsmanager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_ssm_parameter.parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.parameter_non_init](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_init_parameters"></a> [init\_parameters](#input\_init\_parameters) | n/a | `bool` | `false` | no |
| <a name="input_init_secrets"></a> [init\_secrets](#input\_init\_secrets) | n/a | `bool` | `false` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A map of parameters to create in Parameter Store | <pre>list(object({<br>    name  = string<br>    value = string<br>    type  = string<br>  }))</pre> | `[]` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Missing Vraiables:  [ "secret\_string", "path\_key", "path\_prefix" ] | <pre>list(object({<br>    path_prefix   = string<br>    path_key      = string<br>    secret_string = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_arns"></a> [parameter\_arns](#output\_parameter\_arns) | The ARNs of the created parameters |
| <a name="output_parameter_names"></a> [parameter\_names](#output\_parameter\_names) | The names of the created parameters |
| <a name="output_parameter_values"></a> [parameter\_values](#output\_parameter\_values) | The values of the created parameters |
| <a name="output_secrets_arns"></a> [secrets\_arns](#output\_secrets\_arns) | The ARNs of the created secrets |
| <a name="output_secrets_plaintext"></a> [secrets\_plaintext](#output\_secrets\_plaintext) | The plaintext values of the created secrets |
| <a name="output_secrets_version_ids"></a> [secrets\_version\_ids](#output\_secrets\_version\_ids) | The version IDs of the created secret versions |
<!-- END_TF_DOCS -->