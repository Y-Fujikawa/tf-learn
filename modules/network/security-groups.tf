# ALB Security Group
resource "aws_security_group" "tf_learn_alb_sg" {
  name        = "tf-learn-${var.service_name}-${var.stage}-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.tf_learn_vpc.id

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-alb-sg"
    Enviroment = var.stage
  }
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_alb_sg_http" {
  security_group_id = aws_security_group.tf_learn_alb_sg.id
  description       = "Allow HTTP from anywhere"

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_alb_sg_https" {
  security_group_id = aws_security_group.tf_learn_alb_sg.id
  description       = "Allow HTTPS from anywhere"

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "tf_learn_alb_sg_egress" {
  security_group_id = aws_security_group.tf_learn_alb_sg.id
  description       = "Allow all outbound traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# Web Server Security Group
resource "aws_security_group" "tf_learn_web_sg" {
  name        = "tf-learn-${var.service_name}-${var.stage}-web-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.tf_learn_vpc.id

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-web-sg"
    Enviroment = var.stage
  }
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_web_sg_http" {
  security_group_id = aws_security_group.tf_learn_web_sg.id
  description       = "Allow HTTP from ALB"

  referenced_security_group_id = aws_security_group.tf_learn_alb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_web_sg_https" {
  security_group_id = aws_security_group.tf_learn_web_sg.id
  description       = "Allow HTTPS from ALB"

  referenced_security_group_id = aws_security_group.tf_learn_alb_sg.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_web_sg_ssh" {
  security_group_id = aws_security_group.tf_learn_web_sg.id
  description       = "Allow SSH from anywhere"

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "tf_learn_web_sg_egress" {
  security_group_id = aws_security_group.tf_learn_web_sg.id
  description       = "Allow all outbound traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

# Database Security Group
resource "aws_security_group" "tf_learn_db_sg" {
  name        = "tf-learn-${var.service_name}-${var.stage}-db-sg"
  description = "Security group for database servers"
  vpc_id      = aws_vpc.tf_learn_vpc.id

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-db-sg"
    Enviroment = var.stage
  }
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_db_sg_mysql" {
  security_group_id = aws_security_group.tf_learn_db_sg.id
  description       = "Allow MySQL from Web servers"

  referenced_security_group_id = aws_security_group.tf_learn_web_sg.id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "tf_learn_db_sg_postgresql" {
  security_group_id = aws_security_group.tf_learn_db_sg.id
  description       = "Allow PostgreSQL from Web servers"

  referenced_security_group_id = aws_security_group.tf_learn_web_sg.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}
