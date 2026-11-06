resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.iam_cluster_role.arn

  vpc_config{
    security_group_ids=[aws_security_group.sg.id] #i can write security_group_ids=[aws_security_group.sg.id] here but outside the vpc_config block, it will give error because security_group_ids is a part of vpc_config block, so need to write "vpc_security_group_ids=[aws_security_group.sg.id]" outside the vpc_config block.
    subnet_ids=[data.aws_subnet.subnet.id, aws_subnet.subnet2.id]
  
  }

  tags = {
    Name = var.cluster-name
  }

  version = "1.27"

  depends_on = [aws_iam_role_policy_attachment.iam_cluster_policy_attachment]
}


resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node-group-name
  node_role_arn   = aws_iam_role.iam_node_role.arn
  subnet_ids      = [data.aws_subnet.subnet.id, aws_subnet.subnet2.id]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.medium"]

  tags = {
    Name = var.node-group-name
  }

  depends_on = [
    aws_iam_role_policy_attachment.WorkerNodePolicy,
    aws_iam_role_policy_attachment.ContainerRegistryPolicy,
    aws_iam_role_policy_attachment.CNI_Policy]
    
}