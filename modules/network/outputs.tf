# VPC Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.tf_learn_vpc.id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = aws_vpc.tf_learn_vpc.cidr_block
}

# Public Subnet Outputs
output "public_subnet_1a_id" {
  description = "Public subnet ID in ap-northeast-1a"
  value       = aws_subnet.tf_learn_public_subnet_1a.id
}

output "public_subnet_1c_id" {
  description = "Public subnet ID in ap-northeast-1c"
  value       = aws_subnet.tf_learn_public_subnet_1c.id
}

# Private Web Subnet Outputs
output "private_web_subnet_1a_id" {
  description = "Private web subnet ID in ap-northeast-1a"
  value       = aws_subnet.tf_learn_private_web_subnet_1a.id
}

output "private_web_subnet_1c_id" {
  description = "Private web subnet ID in ap-northeast-1c"
  value       = aws_subnet.tf_learn_private_web_subnet_1c.id
}

# Private DB Subnet Outputs
output "private_db_subnet_1a_id" {
  description = "Private database subnet ID in ap-northeast-1a"
  value       = aws_subnet.tf_learn_private_db_subnet_1a.id
}

output "private_db_subnet_1c_id" {
  description = "Private database subnet ID in ap-northeast-1c"
  value       = aws_subnet.tf_learn_private_db_subnet_1c.id
}

# Security Group Outputs
output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = aws_security_group.tf_learn_alb_sg.id
}

output "web_security_group_id" {
  description = "Web server security group ID"
  value       = aws_security_group.tf_learn_web_sg.id
}

output "db_security_group_id" {
  description = "Database security group ID"
  value       = aws_security_group.tf_learn_db_sg.id
}

# NAT Gateway Outputs
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.tf_learn_nat_gateway.id
}

output "nat_eip" {
  description = "NAT Gateway Elastic IP"
  value       = aws_eip.tf_learn_nat_eip.public_ip
}
