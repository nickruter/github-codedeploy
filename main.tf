# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization .
    organization = "Nickel"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "workspace-nickel"
    }
  }
}
   terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}
