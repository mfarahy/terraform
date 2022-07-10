resource "aws_instance" "myec2-db" {
  ami           = "ami-0aebfccd213725cbf"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}
