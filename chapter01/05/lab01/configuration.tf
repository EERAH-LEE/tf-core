terraform {
  required_version = ">=1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_security_group" "sg1" {
    name = "tf-core-lab01-sg1"

    tags = {
      Name = "tf-core-lab01-sg1"
    }
}


resource "aws_security_group" "sg2" {
    name = "tf-core-lab01-sg2"

    tags = {
      Name = "tf-core-lab01-sg2"
    }
}


output "sg2" {
  value = aws_security_group.sg2.id  
}

output "sg1" {
  value = aws_security_group.sg1.id  
}