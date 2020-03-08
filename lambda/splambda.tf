variable "xpath" {
}
resource "aws_lambda_function" "splambda_func" {
  filename = "splambda.zip"
  function_name = "splamda"
  role = ""
  handler = "app.handler"
  runtime = "nodejs10.x"
  environment {
      variables = {
          XPATH_VALUE = var.xpath
      }
  }
  source_code_hash = "${filebase64sha256("lambda/splambda.zip")}"
}