# VPC

resource "aws_vpc" "myVpc" {
  cidr_block = "10.0.0.0/16"
}


#  Internet Gateway 

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myVpc.id

  tags = {
    Name = "igw"
  }
}

# Subnet 

resource "aws_subnet" "mySubnet" {
  vpc_id     = aws_vpc.myVpc.id # Argument
  cidr_block = "10.0.1.0/24"

    tags = {
      Name = "subnet"
    }
}

# Route Table 

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myVpc.id

  route = []
  tags = {
    Name = "routTable-tf"
  }
}

# Route 

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.rt]
}

# Route Table Association 

resource "aws_route_table_association" "rtAss" {
  subnet_id      = aws_subnet.mySubnet.id
  route_table_id = aws_route_table.rt.id
}