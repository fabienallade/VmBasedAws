data "aws_iam_policy_document" "vpc_assume_role" {
  version = "2012-10-17"
  statement {
    effect = "Allow"

    principals {
      identifiers = ["vpc-flow-logs.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpc" {
  name               = "${var.application_name}-${var.environment_name}-network"
  assume_role_policy = data.aws_iam_policy_document.vpc_assume_role.json
}

data "aws_iam_policy_document" "cloudwatch" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "cloudwatch" {
  name   = "${var.application_name}-${var.environment_name}-network-cloudwatch"
  policy = data.aws_iam_policy_document.cloudwatch.json
  role   = aws_iam_role.vpc.id
}

# resource "aws_cloudwatch_log_group" "vpc" {
#   name = "${var.application_name}-${var.environment_name}-network-cloudwatch"
# }
#
# resource "aws_flow_log" "main" {
#   iam_role_arn    = aws_iam_role.vpc.arn
#   log_destination = aws_cloudwatch_log_group.vpc.arn
#   traffic_type    = "ALL"
#   vpc_id          = aws_vpc.main.id
# }