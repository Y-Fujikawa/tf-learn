resource "aws_s3_bucket" "tf_learn_bucket" {
  bucket = "tf-learn-${var.service_name}-${var.stage}-bucket"

  tags = {
    Name       = "tf-learn-${var.service_name}-${var.stage}-bucket"
    Enviroment = var.stage
  }
}