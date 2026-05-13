terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 6.0"
      version = ">=6.0, < 7.0"
    }
  }
}

provider "aws" {
  region = "ap-noretheast-2"

  default_tags {
    tags = {
      project   = "local.project"
      Managedby = "terraform"
    }
  }
}

