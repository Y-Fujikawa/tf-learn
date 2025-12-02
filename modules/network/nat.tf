# Elastic IP for NAT Gateway
resource "aws_eip" "tf_learn_nat_eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.tf_learn_igw]

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-nat-eip"
    Enviroment = var.stage
  }
}

# NAT Gateway (ap-northeast-1aのみ配置)
resource "aws_nat_gateway" "tf_learn_nat_gateway" {
  allocation_id = aws_eip.tf_learn_nat_eip.id
  subnet_id     = aws_subnet.tf_learn_public_subnet_1a.id

  depends_on = [aws_internet_gateway.tf_learn_igw]

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-nat-gateway"
    Enviroment = var.stage
  }
}
