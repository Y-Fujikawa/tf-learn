<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ../modules/lambda | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ../modules/s3 | n/a |
| <a name="module_step-functions"></a> [step-functions](#module\_step-functions) | ../modules/step-functions | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | value of service name | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | value of stage | `string` | `"stg"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->