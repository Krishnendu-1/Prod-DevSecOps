resource "aws_iam_role" "iam_cluster_role" {
  name               = var.iam-cluster-role-name
  assume_role_policy = data.aws_iam_policy_document.iam_cluster_policy.json
}

data "aws_iam_policy_document" "iam_cluster_policy"{
    statement {
        effect  = "Allow"
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["eks.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "iam_node_role"{
    name = var.iam-node-role-name
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
}

