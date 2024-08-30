data "aws_iam_policy_document" "vpc_assume_role" {
  version = "2012-10-17"
  statement {
    effect = "Allow"


    principals {
      identifiers = ["arn:aws:iam::730335223138:user/work"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpc" {
  name               = "${var.application_name}-${var.environment_name}-networks"
  assume_role_policy = data.aws_iam_policy_document.vpc_assume_role.json
}

data "aws_iam_policy_document" "cloudwatch" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:TagResource"
    ]
#     resources = ["*"]
  }
}

resource "aws_iam_role_policy" "cloudwatch" {
  name   = "${var.application_name}-${var.environment_name}-network-cloudwatch"
  policy = data.aws_iam_policy_document.cloudwatch.json
  role   = aws_iam_role.vpc.id
}
