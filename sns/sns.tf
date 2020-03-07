variable "snstag" {
}
resource "aws_sns_topic" "publish_user_events" {
  name = "user_events_topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "numRetries": 5,
      "numNoDelayRetries": 0,
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numMinDelayRetries": 0,
      "numMaxDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false
  }
}
  EOF
tags ={
    name = var.snstag
}
}
output "ec2_event_sns_arn" {
  value = aws_sns_topic.publish_user_events.arn
}