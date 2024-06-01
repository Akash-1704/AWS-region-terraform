variable "region" {
  description = "AWS region"
  type    	= string
}

variable "instance_type" {
  description = "EC2 instance type"
  type    	= string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type    	= string

}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instances"
  type    	= string
}
