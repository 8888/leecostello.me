terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    key    = "leecostello-me"
    bucket = "lee-terraform-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3-static-website" {
  providers = {
    aws.main         = aws
    aws.acm_provider = aws
  }

  source              = "cn-terraform/s3-static-website/aws"
  version             = "1.0.1"
  name_prefix         = "leecostello-me"
  website_domain_name = "leecostello.me"
}
