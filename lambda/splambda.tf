variable "xpath" {
}
resource "aws_iam_role" "role_splambda" {
  name = "iam_role_splambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_role_policy.json
}
data "aws_iam_policy_document" "lambda_role_policy" {
    statement {
        effect = "Allow"
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["lambda.amazonaws.com"]
        }
    }
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