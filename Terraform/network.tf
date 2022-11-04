### VPC and Network resources
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

// INTERNET GATEWAY
resource "aws_internet_gateway" "myvpcIGW" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myvpcIGW"
  }
}

// ROUTE TABLE
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpcIGW.id
  }


  tags = {
    Name = "public"
  }
}

// subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"


  tags = {
    Name = "public-subnet"
  }
}

// Associate subnet to route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public.id
}