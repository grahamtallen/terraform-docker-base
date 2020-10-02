terraform {
  required_providers {
	aws = {
		source = "hashicorp/aws"
		version = "~> 2.70"
	}
  }
}

provider "aws" {
	region = "us-west-2"
	profile = "dancewolf"
}



