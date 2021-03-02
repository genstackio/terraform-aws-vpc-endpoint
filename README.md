# AWS VPC Endpoint Terraform module

Terraform module which creates a VPC Endpoint on AWS.

## Usage

```hcl
module "vpc-endpoint-s3" {
  source  = "genstackio/vpc-endpoint/aws"

  service = "s3"
  vpc_id  = "id-of-the-vpc"
}
```
