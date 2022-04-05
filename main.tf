 # The configuration for the `remote` backend.
     terraform {
       backend "remote" {
         # The name of your Terraform Cloud organization.
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
  region  = "us-east-2"
    access_key = "secrets.AWS_ACCESS_KEY_ID"
    secret_key = "secrets.AWS_SECRET_ACCESS_KEY"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
}