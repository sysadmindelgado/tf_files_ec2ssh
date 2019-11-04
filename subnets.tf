//subnets.tf
resource "aws_subnet" "subnet-circa1999" {
  cidr_block	= "${cidrsubnet(aws_vpc.matrix.cidr_block, 3, 1)}"
  vpc_id	= "${aws_vpc.matrix.id}"
  availability_zone = "us-east-1a"
}

resource "aws_route_table" "route-table-matrix" {
  vpc_id = "${aws_vpc.matrix.id}"

  route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.matrix-gw.id}"
  }

  tags = {
	Name = "route-table-matrix"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id		= "${aws_subnet.subnet-circa1999.id}"
  route_table_id	= "${aws_route_table.route-table-matrix.id}"
}
