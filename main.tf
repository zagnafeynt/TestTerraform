#test
terraform {

  cloud {
    organization = "Zag2281"

    workspaces {
      name = "TerraTest01"
    }
  }

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  default     = "eu-central-1"
  description = "AWS Region"
}

variable "ami" {
  default     = "ami-0292a7daeeda6b851"
  description = "Amazon Linux 2023 AMI"
}

variable "type" {
  default     = "t2.micro"
  description = "Size of VM"
}

resource "aws_instance" "TerraTest01" {
  ami           = "ami-0292a7daeeda6b851"
  instance_type = var.type

  tags = {
    name = "Demo System"
  }
}

output "instance_id" {
  value = var.type
  #instance = aws_instance.demo.id
}
