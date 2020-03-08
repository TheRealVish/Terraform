variable "sns_topic_arn" {
}
resource "aws_sns_topic_subscription" "ec2_state_change_subs" {
  topic_arn = var.sns_topic_arn
  protocol = "lambda"
  endpoint = aws_lambda_function.splambda_func.arn
}
