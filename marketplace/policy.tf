resource "aws_iam_policy" "policy" {
  name        = "isv_market_${var.company}_${var.product}_${var.pricing_type}_saas"
  path        = "/"
  description = "marketplace test account policy for ${var.company}"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "aws-marketplace:ResolveCustomer"
        ],
        "Resource" : [
          "*"
        ]
      },
      {
        "Action" : [
          "aws-marketplace:ViewSubscriptions",
          "aws-marketplace:Subscribe",
          "aws-marketplace:Unsubscribe"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Action" : [
          "aws-marketplace:GetEntitlements"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Action" : [
          "aws-marketplace:BatchMeterUsage"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Action" : [
          "aws-marketplace:MeterUsage"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

output "aws_policy_name" {
  value = aws_iam_policy.policy.name
}
output "aws_policy_arn" {
  value = aws_iam_policy.policy.arn
}