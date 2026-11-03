resource "aws_iam_instance_profile" "instance_profile" {
  name = var.iam-role-name
  role = aws_iam_role.iam_role.name
}