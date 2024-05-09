resource "random_string" "random" {
  length  = 4
  lower   = true
  upper   = false
  numeric = true
  special = false
}

locals {
  # var.nameがnullだったらインスタンス名を`neko-${random_string}`にする
  name = var.service_name == null ? "tf-learn-${random_string.random.result}" : var.service_name
}

module "s3" {
  source = "../modules/s3"

  service_name = var.service_name
  stage        = var.stage
}

module "lambda" {
  source = "../modules/lambda"

  service_name = var.service_name
  stage        = var.stage
}

module "step-functions" {
  source = "../modules/step-functions"

  service_name = var.service_name
  stage        = var.stage
  lambda_arn   = module.lambda.aws_lambda_function_arn
}