variable "aws_region" {
  description = "Add AWS regions"
  default     = ["ap-south-1", "us-east-1"]
  type        = list(string)
}


variable "aws_vpc_name" {
  type        = string
  description = "Add name for your VPC."
  default     = "demo_vpc"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "Add CIDR block for your VPC."
  default     = "192.168.0.0/16"
}

variable "aws_vpc_azs" {
  type        = list(string)
  description = "Add list of AZs available in the region that you want to use. Example ['ap-south-1a', 'ap-south-1b', 'ap-south-1c']"
  default     = ["ap-south-1a", "ap-south-1b"]
}


variable "aws_vpc_public_subnets" {
  type        = list(string)
  description = "Add list of CIDR locks for public subnets in the vpc. Example ['192.168.11.0/24','192.168.12.0/24','192.168.13.0/24']"
  default     = ["192.168.11.0/24", "192.168.12.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "ami_id" {
  description = "Mapping of regions to AMI IDs"
  type        = map(string)
  default = {
    "ap-south-1" = "ami-05e00961530ae1b55" # Example AMI ID for us-east-1
    "us-east-1" = "ami-04b70fa74e45c3917" # Example AMI ID for us-east-2
  }
}

