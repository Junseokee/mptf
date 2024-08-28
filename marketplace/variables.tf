variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "company" {
  description = "업체 이름"
  type        = string
}

variable "product" {
  description = "제품 명"
  type        = string
}

variable "aws_account" {
  description = "업체 AWS 계정"
  type        = list(string)
}

variable "pricing_type" {
  description = "요금 타입"
  type        = string
}

#variable "" {}

variable "SNS_topic_entitlement" {
  description = "업체 entitle SNS arn"
  type        = string
  default     = null
}

variable "SNS_topic_subscription" {
  description = "업체 subscription SNS arn"
  type        = string
  default     = null
}



