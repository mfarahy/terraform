terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}


provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAVJCTWN4TZUPLZGDT"
  secret_key = "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"
}

module "dbserver" {
  source = "./db"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0aebfccd213725cbf"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

}

