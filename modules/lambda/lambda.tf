data "archive_file" "tf_learn_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/app"
  output_path = "${path.module}/tf_learn_${var.service_name}_${var.stage}_lambda.zip"
}

resource "aws_lambda_function" "tf_learn_lambda" {
    function_name = "tf-learn-${var.service_name}-${var.stage}-lambda"

    filename         = data.archive_file.tf_learn_lambda_zip.output_path
    // アップデートのトリガーに使用されるハッシュ
    source_code_hash = filebase64sha256(data.archive_file.tf_learn_lambda_zip.output_path)

    # ラムダ関数に割り当てるIAMロール
    role = aws_iam_role.tf_learn_lambda_role.arn

    # ラムダ関数のハンドラとランタイム
    handler = "main.lambda_handler"
    runtime = "python3.12"
}

resource "aws_iam_role" "tf_learn_lambda_role" {
    name = "tf-learn-lambda-${var.service_name}-${var.stage}-role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "tf_learn_lambda_policy" {
  name        = "tf-learn-lambda-${var.service_name}-${var.stage}-policy"
  description = "IAM policy for the example Lambda function"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          aws_cloudwatch_log_group.tf_learn_lambda_log_group.arn,
          "${aws_cloudwatch_log_group.tf_learn_lambda_log_group.arn}:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tf_learn_lambda_policy_attachment" {
  role       = aws_iam_role.tf_learn_lambda_role.name
  policy_arn = aws_iam_policy.tf_learn_lambda_policy.arn
}

resource "aws_cloudwatch_log_group" "tf_learn_lambda_log_group" {
  name = "/aws/lambda/${var.stage}/${var.service_name}/${aws_lambda_function.tf_learn_lambda.function_name}"
  retention_in_days = 1
}
