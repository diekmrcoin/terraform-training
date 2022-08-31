terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.28"
    }
  }
  required_version = ">= 1.2.7"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
  default_tags {
    tags = {
      Name       = "Training variables"
      deployment = "terraform"
    }
  }
}
