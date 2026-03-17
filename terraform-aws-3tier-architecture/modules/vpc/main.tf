resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "devops-vpc"
  }
}

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-1b"
}

resource "aws_eks_cluster" "my_eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::772780551435:role/Role1"
  version  = "1.27"

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet.id,
      aws_subnet.private_subnet.id
    ]
  }
}
