output "vpc_id" {
  value = module.vpc.vpc_id
}
output "eks_cluster_name" {
  value = aws_eks_cluster.my_eks_cluster.name
}
