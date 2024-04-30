terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }
  }
  backend "s3" {
    region = "ap-northeast-1"
    key    = "terraform.tfstate"
  }

  required_version = ">= 1.8.2"
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      terraform = "true"
    }
  }
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