resource "aws_vpc" "terravpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "TerraVPC-${local.sufixtags}"
  }
}

resource "aws_subnet" "pubsubnet" {
  for_each                = { for psub in var.pubsubnets : psub["pubsubnets"] => psub }
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = each.value["pubsubnets"]
  map_public_ip_on_launch = true
  availability_zone       = each.value["subzones"]
  tags = {
    Name = "TerraPublicSubnet-${local.sufixtags}"

  }
}

resource "aws_subnet" "privsubnet" {
  for_each                = { for prsub in var.privsubnets : prsub["privsubnets"] => prsub }
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = each.value["privsubnets"]
  map_public_ip_on_launch = false
  availability_zone       = each.value["subzones"]
  tags = {
    Name = "TerraPrivateSubnet-${local.sufixtags}"

  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terravpc.id
  tags = {
    Name = "TerraIGW-${local.sufixtags}"
  }
}

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.terravpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "TerraPublicRT-${local.sufixtags}"
  }

}

resource "aws_route_table_association" "publicrtasso" {
  for_each       = { for psub in var.pubsubnets : psub["pubsubnets"] => psub }
  subnet_id      = aws_subnet.pubsubnet[each.key].id
  route_table_id = aws_route_table.publicrt.id
  depends_on     = [aws_subnet.pubsubnet]
}