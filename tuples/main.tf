resource "aws_vpc" "my-web-server" {

  cidr_block = "10.0.0.0/16"

}

variable "my-tuple" {
  type    = tuple(string, number)
  default = ["test", 12]
}

variable "my-object" {
  type = object({ name = string, age = number })
  default = {
    name = "test"
    age  = 22
  }
}
