provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
}

module "vpc" {
  source = "./modules/vpc"
}

resource "aws_eks_cluster" "my_eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::772780551435:role/Role1"
  version  = "1.29"

  vpc_config {
    subnet_ids = [
      module.vpc.public_subnet_id,
      module.vpc.private_subnet_id
    ]
  }
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.my_eks_cluster.name
  node_group_name = "my-nodes"
  node_role_arn   = aws_iam_role.worker_nodes.arn

  subnet_ids = [
    module.vpc.public_subnet_id,
    module.vpc.private_subnet_id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}
