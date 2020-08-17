#
# VPC resources
#
resource "aws_vpc" "dishvpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name        = var.name,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_internet_gateway" "dishigw" {
  vpc_id = aws_vpc.dishvpc.id

  tags = merge(
    {
      Name        = "gwInternet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table" "private01" {
  count = length(var.private_subnets_01)

  vpc_id = aws_vpc.dishvpc.id

  tags = merge(
    {
      Name        = "PrivateRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table" "private02" {
  count = length(var.private_subnets_02)

  vpc_id = aws_vpc.dishvpc.id

  tags = merge(
    {
      Name        = "PrivateRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "private01" {
  count = length(var.private_subnets_01)

  route_table_id         = aws_route_table.private01[count.index].id
  destination_cidr_block = "0.0.0.0/0"
 # nat_gateway_id         = aws_nat_gateway.dishnat[count.index].id
  nat_gateway_id = element(aws_nat_gateway.dishnat.*.id, count.index)
}

resource "aws_route" "private02" {
  count = length(var.private_subnets_02)

  route_table_id         = aws_route_table.private02[count.index].id
  destination_cidr_block = "0.0.0.0/0"
 # nat_gateway_id         = aws_nat_gateway.dishnat[count.index].id
  nat_gateway_id = element(aws_nat_gateway.dishnat.*.id, count.index)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dishvpc.id

  tags = merge(
    {
      Name        = "PublicRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dishigw.id
}

resource "aws_subnet" "private01" {
  //count = length(var.private_subnets_01)

    for_each = var.private_subnets_01
    //az_count = length(var.availability_zones)
    //count = 20
    vpc_id            = aws_vpc.dishvpc.id
    //cidr_block        = "${cidrsubnet(var.cidr_block, 8, count.index)}"
    cidr_block        = each.value
    availability_zone = var.availability_zones[0]

    tags = merge(
      {
        Name        = each.key,
        Project     = var.project,
        Environment = var.environment
      },
      var.tags
    )
}

resource "aws_subnet" "private02" {
  //count = length(var.private_subnet_cidr_blocks02)
  //az_count = length(var.availability_zones)
  //count = 20
  for_each = var.private_subnets_01
  vpc_id            = aws_vpc.dishvpc.id
  //cidr_block        = "${cidrsubnet(var.cidr_block, 8, count.index)}"
  cidr_block        = each.value
  availability_zone = var.availability_zones[1]

  tags = merge(
    {
      Name        = each.key,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.dishvpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name        = "PublicSubnet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table_association" "private01" {
  count = length(var.private_subnets_01)

  subnet_id      = aws_subnet.private01[count.index].id
  route_table_id = aws_route_table.private01[count.index].id
}

resource "aws_route_table_association" "private02" {
  count = length(var.private_subnets_02)

  subnet_id      = aws_subnet.private02[count.index].id
  route_table_id = aws_route_table.private02[count.index].id
}


resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  count = length(var.public_subnet_cidr_blocks)

  vpc = true
}

resource "aws_nat_gateway" "dishnat" {
  depends_on = [aws_internet_gateway.dishigw]

  count = length(var.public_subnet_cidr_blocks)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    {
      Name        = "gwNAT",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}
