provider "aws" {
  region = "ap-south-1"
}

module "vpc-ap-south-1" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs
  public_subnets  = var.aws_vpc_public_subnets

  tags = {
    Name = "vpc-ap-south-1"
  }
}

module "vpc-us-east-1" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs
  public_subnets  = var.aws_vpc_public_subnets
  
  providers = {
    aws = aws.us_east_1
  }

  tags = {
    Name = "vpc-us-east-1"
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

module "ec2_ap_south_1" {
  source        = "./modules/ec2"
  region        = "ap-south-1"
  instance_type = var.instance_type
  subnet_id     = element(module.vpc-ap-south-1.public_subnets, 0)
  ami_id        = var.ami_id
}

module "ec2_us_east_1" {
  source        = "./modules/ec2"
  region        = "us-east-1"
  instance_type = var.instance_type
  subnet_id     = element(module.vpc-us-east-1.public_subnets, 0)
  ami_id        = var.ami_id
}
