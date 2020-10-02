resource "aws_security_group" "ssh" {
	name = "ssh-allow-all"
	vpc_id = aws_vpc.main.id
	ingress {
		cidr_blocks = [
		    "0.0.0.0/0"
		]

		from_port = 22
		to_port = 22
		protocol = "tcp"
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "Allow web traffic on 80"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver"
  }
}
