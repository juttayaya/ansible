provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "he-fedex" {
  ami = "ami-5850244e"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.he-sg.id}"]
  key_name = "he-keypair"

  tags {
    Name = "he-centos7"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group" "he-sg" {
  name = "he-centos7-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


