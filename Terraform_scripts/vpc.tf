provider "aws" {
  region        = var.aws_region
  access_key    = ""
  secret_key    = ""
}

resource "aws_vpc" "Cluster_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Cluster_vpc"
  }
}

resource "aws_internet_gateway" "Cluster_igw" {
  vpc_id = aws_vpc.Cluster_vpc.id
  tags = {
    Name = "Cluster_igw"
  }
}

resource "aws_subnet" "Cluster_subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id                  = aws_vpc.Cluster_vpc.id
  cidr_block              = element(var.subnet_cidr, count.index)
  availability_zone       = var.aws_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "Cluster_subnet_$(count.index + 1)"
  }
}

resource "aws_route_table" "Cluster_rt" {
  vpc_id = aws_vpc.Cluster_vpc.id
  depends_on = [aws_internet_gateway.Cluster_igw]
  route = [{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Cluster_igw.id
    carrier_gateway_id         = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    instance_id                = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "Cluster_rt"
  }
}

resource "aws_route_table_association" "rt_sub_association" {
  count          = length(var.subnet_cidr)
  subnet_id      = element(aws_subnet.Cluster_subnets.*.id, count.index)
  route_table_id = aws_route_table.Cluster_rt.id
}