terraform {
  backend "s3" {
    bucket       = "EKS-Terraform-Backend"
    key          = "MegaDevOps/EKS/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}