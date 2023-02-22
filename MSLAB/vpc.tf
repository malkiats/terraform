# Resource-1: Create VPC
resource "aws_vpc" "vpc-mslab" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "name" = "vpc-mslab"
  }
}

# Resource-2: Create Subnets
resource "aws_subnet" "vpc-mslab-subnet-1" {
  vpc_id = aws_vpc.vpc-mslab.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
}


# Resource-3: Internet Gateway
resource "aws_internet_gateway" "vpc-mslab-igw" {
  vpc_id = aws_vpc.vpc-mslab.id
}

# Resource-4: Create Route Table
resource "aws_route_table" "vpc-mslab-route-table" {
  vpc_id = aws_vpc.vpc-mslab.id
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-mslab-public-route" {
  route_table_id = aws_route_table.vpc-mslab-route-table.id 
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-mslab-igw.id 
}


# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-mslab-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-mslab-route-table.id 
  subnet_id = aws_subnet.vpc-mslab-subnet-1.id
}

# Resource-7: Create Security Group
resource "aws_security_group" "mslab-vpc-sg" {
  name = "mslab-vpc-default-sg"
  vpc_id = aws_vpc.vpc-mslab.id
  description = "MSLAB VPC Default Security Group"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
