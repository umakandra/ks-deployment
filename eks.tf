


# Create the EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::135808915413:role/AmazonEKSAutoClusterRole"

  vpc_config {
    subnet_ids = [aws_subnet.private1.id,aws_subnet.private2.id]  # Replace with your actual subnet IDs
  }

}


# Create EKS Node Group
resource "aws_eks_node_group" "node_group-1" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  node_group_name = "my-node-group-1"
  node_role_arn = "arn:aws:iam::135808915413:role/AmazonEKSAutoNodeRole"
  subnet_ids    = [aws_subnet.private1.id,aws_subnet.private2.id] # Replace with actual subnet IDs
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
}
