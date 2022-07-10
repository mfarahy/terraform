provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAVJCTWN4TZUPLZGDT"
  secret_key = "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"
}
variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["item1", "item2"]
}

variable "mymap" {
  type = map(string)
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}
