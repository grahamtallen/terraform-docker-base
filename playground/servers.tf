data "template_file" "user_data" {
	template = file("../scripts/docker-cloud-init.yml")
}

resource "aws_instance" "test-ec2-instance" {
	ami = var.ami_id
	instance_type = "t2.micro"
	security_groups = [
		aws_security_group.ssh.id,
		aws_security_group.webserver.id
	]

	subnet_id = aws_subnet.subnet-uno.id

	user_data = data.template_file.user_data.rendered
	
	tags = {
		Name = var.ami_name
	}
}
