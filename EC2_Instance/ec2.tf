resource "aws_instance" "example" {
  
  instance_type = "t3.micro"
  ami = "ami-096ef200a877f36af"
}

resource "aws_security_group" "web" {
    name = "web"
    description = "Allow TLS inbound traffic and all outbound traffic"


    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
  
}