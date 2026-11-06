resource "aws_iam_role_policy_attachment" "iam_cluster_policy_attachment"{
    role=aws_iam_role.iam_cluster_role.name
    policy_arn="arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

resource "aws_iam_role_policy_attachment" "WorkerNodePolicy"{
    role=aws_iam_role.iam_node_role.name
    policy_arn="arn:aws:iam::aws:policy/AWSEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "ContainerRegistryPolicy"{
    role=aws_iam_role.iam_node_role.name
    policy_arn="arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

resource "aws_iam_role_policy_attachment" "CNI_Policy"{
    role=aws_iam_role.iam_node_role.name
    policy_arn="arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}