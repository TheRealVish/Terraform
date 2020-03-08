variable "xpath" {
}
resource "aws_iam_role" "role_splambda" {
  name = "iamrolesplambda"
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
resource "aws_iam_role_policy" "role_policy_splambda" {
  name = "splrolepolicy"
  role = aws_iam_role.role_splambda.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudformation:DescribeChangeSet",
                "cloudformation:DescribeStackResources",
                "cloudformation:DescribeStacks",
                "cloudformation:GetTemplate",
                "cloudformation:ListStackResources",
                "cloudwatch:*",
                "events:*",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListRolePolicies",
                "iam:ListRoles",
                "iam:PassRole",
                "lambda:*",
                "logs:*",
                "s3:*",
                "sns:ListSubscriptions",
                "sns:ListSubscriptionsByTopic",
                "sns:ListTopics",
                "sns:Publish",
                "sns:Subscribe",
                "sns:Unsubscribe"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}
resource "aws_lambda_function" "splambda_func" {
  filename = "lambda/splambda.zip"
  function_name = "splambda"
  role = aws_iam_role.role_splambda.arn
  handler = "app.handler"
  runtime = "nodejs10.x"
  environment {
      variables = {
          XPATH_VALUE = var.xpath
      }
  }
  source_code_hash = "${filebase64sha256("lambda/splambda.zip")}"
}
resource "aws_lambda_permission" "spl_perm" {
  statement_id = "AllowExecutionFromSNS"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.splambda_func.arn}"
  principal = "sns.amazonaws.com"
  source_arn = var.sns_topic_arn
}
