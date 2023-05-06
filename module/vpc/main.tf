locals {
  netname = var.name
}

resource "aws_vpc" "test-vpc" {
  cidr_block = var.cidr
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${local.netname}-vpc"
  }
}

resource "aws_subnet" "test-subnet" {
  count = length(var.sum)
  vpc_id = aws_vpc.test-vpc.id
  availability_zone = element(var.zone,count.index)
  cidr_block = element(var.sum,count.index)

  tags = {
    Name = "${local.netname}-subnet"
  }
}

resource "aws_route_table_association" "test-connect" {
  count = length(var.sum)
  subnet_id = "${element(aws_subnet.test-subnet.*.id,count.index)}"
  route_table_id = aws_vpc.test-vpc.default_route_table_id
}
