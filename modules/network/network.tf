# VPC
resource "aws_vpc" "tf_learn_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-vpc"
    Enviroment = var.stage
  }
}

# Internet Gateway
resource "aws_internet_gateway" "tf_learn_igw" {
  vpc_id = aws_vpc.tf_learn_vpc.id

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-igw"
    Enviroment = var.stage
  }
}

# Public Subnets (ALB用)
resource "aws_subnet" "tf_learn_public_subnet_1a" {
  vpc_id                  = aws_vpc.tf_learn_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-public-alb-subnet-1a"
    Enviroment = var.stage
  }
}

resource "aws_subnet" "tf_learn_public_subnet_1c" {
  vpc_id                  = aws_vpc.tf_learn_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-public-alb-subnet-1c"
    Enviroment = var.stage
  }
}

# Private Web Subnets (Webサーバー用)
resource "aws_subnet" "tf_learn_private_web_subnet_1a" {
  vpc_id            = aws_vpc.tf_learn_vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-web-subnet-1a"
    Enviroment = var.stage
  }
}

resource "aws_subnet" "tf_learn_private_web_subnet_1c" {
  vpc_id            = aws_vpc.tf_learn_vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-web-subnet-1c"
    Enviroment = var.stage
  }
}

# Private DB Subnets (DBサーバー用)
resource "aws_subnet" "tf_learn_private_db_subnet_1a" {
  vpc_id            = aws_vpc.tf_learn_vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-db-subnet-1a"
    Enviroment = var.stage
  }
}

resource "aws_subnet" "tf_learn_private_db_subnet_1c" {
  vpc_id            = aws_vpc.tf_learn_vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-private-db-subnet-1c"
    Enviroment = var.stage
  }
}
