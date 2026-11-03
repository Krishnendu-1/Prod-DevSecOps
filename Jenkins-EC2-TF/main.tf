resource "aws_instance" "jenkins_ec2_instance" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t3.medium"
  key_name             = var.key-name
  subnet_id            = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name #connect the IAM role to the EC2 instance, coz it's like the tunnel which passes the iam_role to the EC2 instance, so that the EC2 instance can use the iam_role to access the AWS resources.


  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  user_data = templatefile("./tools.sh", {}) #to initialize the EC2 instance with the tools.sh script, which will install Jenkins and other necessary tools on the EC2 instance.
  tags = {
    Name = var.instance-name
  }
}