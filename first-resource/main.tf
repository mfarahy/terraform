provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAVJCTWN4TZUPLZGDT"
  secret_key = "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"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.vpcname}"
  }
}
