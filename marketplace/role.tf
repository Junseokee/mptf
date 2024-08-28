locals {
  formatted_date = formatdate("YYYYMMDD", timestamp())
  short_date     = substr(local.formatted_date, 2, 6)
}

resource "aws_iam_role" "role" {
  name = "isv_market_${var.company}_${var.product}_${var.pricing_type}_saas_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Principal = {
          AWS = var.aws_account
        },
        Condition = {
          StringEquals = {
            "sts:ExternalId" = "${var.company}_${var.product}_${var.pricing_type}_saas_${local.short_date}"
          }
        }
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attach" {
  policy_arn = aws_iam_policy.policy.arn
  role       = aws_iam_role.role.name
  description = "role_policy_attach"
}

output "aws_role_name" {
  value = aws_iam_role.role.name
  description = "aws_role_name"
}
output "aws_role_arn" {
  value = aws_iam_role.role.arn
  description = "aws_role_arn"
}

output "aws_role_assume_role_policy" {
  value = aws_iam_role.role.assume_role_policy
  description = "aws_role_assume_role_policy"
}
