//gateways.tf
resource "aws_internet_gateway" "matrix-gw" {
   vpc_id = "${aws_vpc.matrix.id}"

   tags = {
	Name = "matrix-gw"
   }
}

