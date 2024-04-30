resource "aws_iam_role" "tf_learn_sfn_state_machine_role" {
  name = "tf-learn-${var.service_name}-${var.stage}-sfn-state-machine-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "states.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF

  tags = {
    Enviroment = var.stage
  }
}

resource "aws_iam_policy" "tf_learn_sfn_state_machine_policy" {
  name        = "tf-learn-${var.service_name}-${var.stage}-sfn-state-machine-policy"
  description = "IAM policy for the example Step Functions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "states:StartExecution",
          "states:DescribeExecution",
          "states:StopExecution",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          "*"
        ]
      }
    ]
  })

  tags = {
    Enviroment = var.stage
  }
}

resource "aws_iam_role_policy_attachment" "tf_learn_sfn_state_machine_policy_attachment" {
  role       = aws_iam_role.tf_learn_sfn_state_machine_role.name
  policy_arn = aws_iam_policy.tf_learn_sfn_state_machine_policy.arn
}

resource "aws_cloudwatch_log_group" "tf_learn_sfn_state_machine_log_group" {
  name              = "/aws/stepfunctions/${aws_sfn_state_machine.tf_learn_sfn_state_machine.name}"
  retention_in_days = 1

  tags = {
    Enviroment = var.stage
  }
}

resource "aws_sfn_state_machine" "tf_learn_sfn_state_machine" {
  name     = "tf-learn-${var.service_name}-${var.stage}-sfn-state-machine"
  role_arn = aws_iam_role.tf_learn_sfn_state_machine_role.arn

  definition = templatefile(
    "${path.module}/definition.tftpl",
    {}
  )

  type = "STANDARD"

  logging_configuration {
    include_execution_data = false
    level                  = "OFF"
  }

  tags = {
    Enviroment = var.stage
  }
}
