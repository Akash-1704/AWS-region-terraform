terraform {
  required_providers = {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # (if you had a backend configuration in your
  # old root module then move that into here too)
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

module "vpc-ap-south-1" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs["ap-south-1"]
  public_subnets  = var.aws_vpc_public_subnets

  providers = {
    aws = aws.ap-south-1
  }

  tags = {
    Name = "vpc-ap-south-1"
  }
}

module "vpc-us-east-1" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs["us-east-1"]
  public_subnets  = var.aws_vpc_public_subnets
  
  providers = {
    aws = aws.us-east-1
  }

  tags = {
    Name = "vpc-us-east-1"
  }
}



module "ec2_ap_south_1" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  subnet_id     = element(module.vpc-ap-south-1.public_subnets, 0)
  ami_id        = var.ami_id["ap-south-1"]
  providers = {
    aws = aws.ap-south-1
  }
}

module "ec2_us_east_1" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  subnet_id     = element(module.vpc-us-east-1.public_subnets, 0)
  ami_id        = var.ami_id["us-east-1"]
  providers = {
    aws = aws.us-east-1
  }
}
