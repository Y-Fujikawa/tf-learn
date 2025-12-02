# Public Route Table
resource "aws_route_table" "tf_learn_public_rt" {
  vpc_id = aws_vpc.tf_learn_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_learn_igw.id
  }

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-public-rt"
    Enviroment = var.stage
  }
}

# Public Route Table Associations
resource "aws_route_table_association" "tf_learn_public_rt_1a" {
  subnet_id      = aws_subnet.tf_learn_public_subnet_1a.id
  route_table_id = aws_route_table.tf_learn_public_rt.id
}

resource "aws_route_table_association" "tf_learn_public_rt_1c" {
  subnet_id      = aws_subnet.tf_learn_public_subnet_1c.id
  route_table_id = aws_route_table.tf_learn_public_rt.id
}

# Private Web Route Table
resource "aws_route_table" "tf_learn_private_web_rt" {
  vpc_id = aws_vpc.tf_learn_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tf_learn_nat_gateway.id
  }

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-web-rt"
    Enviroment = var.stage
  }
}

# Private Web Route Table Associations
resource "aws_route_table_association" "tf_learn_private_web_rt_1a" {
  subnet_id      = aws_subnet.tf_learn_private_web_subnet_1a.id
  route_table_id = aws_route_table.tf_learn_private_web_rt.id
}

resource "aws_route_table_association" "tf_learn_private_web_rt_1c" {
  subnet_id      = aws_subnet.tf_learn_private_web_subnet_1c.id
  route_table_id = aws_route_table.tf_learn_private_web_rt.id
}

# Private DB Route Table (インターネットアクセスなし)
resource "aws_route_table" "tf_learn_private_db_rt" {
  vpc_id = aws_vpc.tf_learn_vpc.id

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-db-rt"
    Enviroment = var.stage
  }
}

# Private DB Route Table Associations
resource "aws_route_table_association" "tf_learn_private_db_rt_1a" {
  subnet_id      = aws_subnet.tf_learn_private_db_subnet_1a.id
  route_table_id = aws_route_table.tf_learn_private_db_rt.id
}

resource "aws_route_table_association" "tf_learn_private_db_rt_1c" {
  subnet_id      = aws_subnet.tf_learn_private_db_subnet_1c.id
  route_table_id = aws_route_table.tf_learn_private_db_rt.id
}
