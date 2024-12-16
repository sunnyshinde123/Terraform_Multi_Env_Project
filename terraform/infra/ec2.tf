resource "aws_key_pair" "my_key" {
  key_name = "${var.env}-key"
  public_key = file("terraform-key.pub")
}

resource "aws_default_vpc" "my_vpc" {
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_security_group" "my_security" {
  name = "${var.env}-security"
  description = "this is the security group of ${var.env}"
  vpc_id = aws_default_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name =  "${var.env}-security"
  }
}

resource "aws_instance" "my_instance" {
  instance_type = var.instance_type
  count = var.instance_count
  ami = var.ami
  security_groups = [aws_security_group.my_security.name]
  key_name = aws_key_pair.my_key.key_name

  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-ec2"
    Environment = var.env
  }
}
