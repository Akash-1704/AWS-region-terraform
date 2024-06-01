resource "aws_instance" "instance" {
  ami       	= var.ami_id
  instance_type = var.instance_type
  subnet_id 	= var.subnet_id
  region        = var.region

  tags = {
	Name = "terraform-instance"
  }
}
