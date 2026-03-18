provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
}

module "security_groups" {
  source  = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
  admin_ip = var.admin_ip
}

resource "aws_iam_role" "worker_nodes" {
  name = "eks-node-role"
  assume_role_policy = data.aws_iam_policy_document.eks_worker_nodes.json
}

data "aws_iam_policy_document" "eks_worker_nodes" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
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
  depends_on = [module.security_groups]
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
