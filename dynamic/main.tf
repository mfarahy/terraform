variable "ingress_rules" {
  type    = list(number)
  default = [25, 80, 8080, 443, 8443]
}

variable "egress_rules" {
  type    = list(number)
  default = [443, 8443]
}

resource "aws_instance" "web" {
  ami             = "ami-876878767"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.web_traffic.name]
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "web_traffic" {
  name = "Security Server"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }
}
