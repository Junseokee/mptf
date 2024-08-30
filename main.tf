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
  access_key = ""
  secret_key = ""
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