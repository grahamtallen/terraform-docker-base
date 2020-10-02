resource "aws_subnet" "subnet-uno" {
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 3, 1)
  vpc_id = aws_vpc.main.id
  availability_zone = "us-west-2a"
}


resource "aws_route_table" "route-table-main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  } 
  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-uno.id
  route_table_id = aws_route_table.route-table-main.id
}
