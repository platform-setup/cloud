provider "aws" {
  region                  = "ap-southeast-1"
  profile                  = "eks"
}

# cluster creation 
resource "aws_eks_cluster" "aws_eks" {
  name     = "PhatNguyen"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = ["subnet-caf65d93", "subnet-98f20efe", "subnet-0d5eb345"]
  }

  tags = {
    Name = "myeks"
  }
}

resource "aws_iam_role" "eks_nodes" {
  name = "eks_ng_gp"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_eks_node_group" "node1" {
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "ng-1"
  instance_types   =["t2.micro"]
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = ["subnet-caf65d93", "subnet-98f20efe", "subnet-0d5eb345"]
  disk_size       = 1
  remote_access {
   ec2_ssh_key = "PhatNguyen"
   source_security_group_ids = ["sg-4d384e33"]
  }
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}

# resource "aws_efs_file_system" "efs" {
#   creation_token = "efs-token"

#   tags = {
#     Name = "EKS"
#   }
# }

# resource "aws_efs_mount_target" "subnet1" {
#   file_system_id = aws_efs_file_system.efs.id
#   subnet_id = "subnet-05bbfb852798f8c1b"
#   security_groups = ["sg-06981c6597718708c"]
# }

# resource "aws_efs_access_point" "efs_ap" {
#   file_system_id = aws_efs_file_system.efs.id
# }