provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

