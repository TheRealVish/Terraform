resource "aws_cloudwatch_event_rule" "cw_rule_ec2_events" {
  name = "ec2_states_event_rule"
  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
  PATTERN
}
output "cw_event_rule_id" {
  value = aws_cloudwatch_event_rule.cw_rule_ec2_events.id
  sensitive = true
}
