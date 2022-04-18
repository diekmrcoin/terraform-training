terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }

  required_version = ">= 1.1.8"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}

resource "aws_vpc" "terraform_course" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name                = "terraform-course"
    "Available subnets" = "16 of /20"
  }
}

resource "aws_route_table" "terraform_course_route_table" {
  vpc_id = aws_vpc.terraform_course.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "terraform-course"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform_course.id
  tags = {
    Name = "terraform-course"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.terraform_course.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "eu-west-3a"
  map_public_ip_on_launch = true
  tags = {
    Name  = "terraform-course"
    Hosts = "4094"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.terraform_course.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true
  tags = {
    Name  = "terraform-course"
    Hosts = "4094"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id                  = aws_vpc.terraform_course.id
  cidr_block              = "10.0.32.0/20"
  availability_zone       = "eu-west-3c"
  map_public_ip_on_launch = true
  tags = {
    Name  = "terraform-course"
    Hosts = "4094"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.terraform_course_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.terraform_course_route_table.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet_c.id
  route_table_id = aws_route_table.terraform_course_route_table.id
}
