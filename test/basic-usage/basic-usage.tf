terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

variable "name" {
  type    = string
  default = "tf-basic-usage-topic"
}

variable "topic_prefix" {
  type    = string
  default = "my-product-name"
}

variable "tags" {
  type = map(string)
  default = {
    example = "true"
  }
}

module "sns_topic" {
  source = "../.."

  name         = var.name
  topic_prefix = var.topic_prefix
  tags         = var.tags
}
output "sns_topic" { value = module.sns_topic }
