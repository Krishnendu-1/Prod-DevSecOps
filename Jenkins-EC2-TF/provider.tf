data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  #if i dont use it then i have to accept the terms and conditions of the AMI manually, which is not possible in terraform, so i have to use this owner id to get the AMI without accepting the terms and conditions.
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

provider "aws" {
  region = "ap-south-1"
}