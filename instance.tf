terraform {
  required_providers {
	aws = {
		source = "hashicorp/aws"
		version = "~> 2.70"
	}
  }
}

provider "aws" {
	profile = "dancewolf"
	reigon = "us-west-2"
}

resource "aws_instance" "example" {
	ami           = "ami-830c94e3"
	instance_type = "t2.micro"
}

