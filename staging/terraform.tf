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
