variable vpc-name {
  description = "Name of the VPC"
  type        = string
}
variable sg-name {
  description = "Name of the Security Group"
  type        = string
}
variable rt-name2 {
  description = "Name of the Route Table for EKS"
  type        = string
}
variable subnet-name {
  description = "Name of the Subnet"
  type        = string
}
variable subnet-name2 {
  description = "Name of the Subnet for EKS"
  type        = string
}
variable igw-name {
  description = "Name of the Internet Gateway"
  type        = string
}
variable cluster-name {
  description = "Name of the EKS Cluster"
  type        = string
}
variable iam-cluster-role-name {
  description = "Name of the IAM Role for EKS Cluster"
  type        = string
}
variable iam-node-role-name {
  description = "Name of the IAM Role for EKS Node Group"
  type        = string
}
variable node-group-name {
  description = "Name of the EKS Node Group"
  type        = string
}
