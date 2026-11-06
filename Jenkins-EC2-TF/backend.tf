terraform {
  backend "s3" {
    bucket       = "Jenkins-EC2-TF-Terraform-Backend"
    key          = "MegaDevOps/Jenkins-EC2-TF/terraform.tfstate"
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