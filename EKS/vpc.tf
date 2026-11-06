data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc-name]
  }
    
}
data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet-name]
  }
}
data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = [var.sg-name]
  }
}
data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = [var.igw-name]
  }
}

resource "aws_subnet" "subnet2"{
    cidr_block= "10.0.2.0/24"
    map_public_ip_on_launch = true
    vpc_id = data.aws_vpc.vpc.id
    availability_zone = "ap-south-1b"

    tags = {
       Name= var.subnet-name2
    }

}

resource "aws_route_table" "rt2" {
    vpc_id=data.aws_vpc.vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = data.aws_internet_gateway.igw.id
    }
    tags={
        Name=var.rt-name2
    }
    

  
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rt2.id
}
