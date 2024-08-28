<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.7.0 |

## Example

```hcl
#provider "aws" {
#  access_key = ""
#  secret_key = ""
#  region = ""
#}
module "marketplace_role" {
  source = "./marketplace"
  aws_account = [""]
  company = ""
  pricing_type = ""
  product = ""
}

output "policy_arn" {
  value = module.marketplace_role.aws_policy_arn
}
output "policy_name" {
  value = module.marketplace_role.aws_policy_name
}

output "role_name" {
  value = module.marketplace_role.aws_role_name
}
output "role_arn" {
  value = module.marketplace_role.aws_role_arn
}
output "role_assume_role_policy" {
  value = jsondecode(module.marketplace_role.aws_role_assume_role_policy)["Statement"][0]["Condition"]["StringEquals"]["sts:ExternalId"]
}
```

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SNS_topic_entitlement"></a> [SNS\_topic\_entitlement](#input\_SNS\_topic\_entitlement) | 업체 entitle SNS arn | `string` | `null` | no |
| <a name="input_SNS_topic_subscription"></a> [SNS\_topic\_subscription](#input\_SNS\_topic\_subscription) | 업체 subscription SNS arn | `string` | `null` | no |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | 업체 AWS 계정 | `list(string)` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | 업체 이름 | `string` | n/a | yes |
| <a name="input_pricing_type"></a> [pricing\_type](#input\_pricing\_type) | 요금 타입 | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | 제품 명 | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_policy_arn"></a> [aws\_policy\_arn](#output\_aws\_policy\_arn) | aws\_policy\_arn |
| <a name="output_aws_policy_name"></a> [aws\_policy\_name](#output\_aws\_policy\_name) | aws\_policy\_name |
| <a name="output_aws_role_arn"></a> [aws\_role\_arn](#output\_aws\_role\_arn) | aws\_role\_arn |
| <a name="output_aws_role_assume_role_policy"></a> [aws\_role\_assume\_role\_policy](#output\_aws\_role\_assume\_role\_policy) | aws\_role\_assume\_role\_policy |
| <a name="output_aws_role_name"></a> [aws\_role\_name](#output\_aws\_role\_name) | aws\_role\_name |
<!-- END_TF_DOCS -->