# SNS Topic

Basic quickstart for creating a SNS Topic resource.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "sns_topic" {
  source  = "so1omon563/sns/aws"
  version = "2.0.0" # Replace with appropriate version

  name         = "example-topic"
  topic_prefix = "my-product-name"
  tags = {
    example = "true"
  }
}
output "sns_topic" { value = module.sns_topic }
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | so1omon563/sns/aws | 2.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic"></a> [sns\_topic](#output\_sns\_topic) | n/a |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
