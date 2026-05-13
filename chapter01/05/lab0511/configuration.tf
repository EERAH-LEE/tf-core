terraform {
  required_version = ">=1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws" #provider를 모아 놓은 곳
      version = "~>6.0"         # 6점대 버전까지만 사용 가능 (7.X 으로 가면 에러.)
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

locals {
  vpc_cidr_block = "10.0.0.0/24"
}

resource "aws_vpc" "galluxy" {         # name 의 galluxy는 테라폼에서 관리하는 이름(클라우드와 상관없음.)
  cidr_block           = local.vpc_cidr_block # "" 이걸로 꼭 가둬 두기
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-core-lab05-vpc-galluxy" # naming 규칙이 존재 (organizaion-project)
  }
}

output "vpc" {
  value = {
    id = aws_vpc.galluxy.id
    arn = aws_vpc.galluxy.arn
  }
}