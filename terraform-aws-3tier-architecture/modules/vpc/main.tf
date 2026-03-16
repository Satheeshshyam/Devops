resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "devops-vpc"
  }
}

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-south-1b"
}
