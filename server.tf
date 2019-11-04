//example.tf
resource "aws_instance" "headquarters" {
  ami           	= "ami-0b69ea66ff7391e80"
  instance_type 	= "t2.micro"
  key_name		= "la-clef"
  security_groups	= ["${aws_security_group.secgrp-all-matrix.id}"]

  subnet_id = "${aws_subnet.subnet-circa1999.id}"
}

resource "aws_key_pair" "merovingian" {
  key_name	= "la-clef"
  public_key	= "${file("pubkey.pub")}"
}



