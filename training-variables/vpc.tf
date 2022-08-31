resource "aws_vpc" "vpcs" {
  count = length(var.structure)
  cidr_block           = var.structure[count.index].cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnets" {
  count = length(var.structure)
  vpc_id                  = aws_vpc.vpcs[count.index].id
  cidr_block              = var.structure[count.index].subnet
  availability_zone       = var.default_zone
  map_public_ip_on_launch = true
}
