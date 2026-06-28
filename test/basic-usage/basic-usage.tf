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
  default = "tf-basic-usage-topic"
}

variable "topic_prefix" {
  default = "my-product-name"
}

variable "tags" {
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
