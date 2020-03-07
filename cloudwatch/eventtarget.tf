variable "event_sns_arn" {
}
resource "aws_cloudwatch_event_target" "cw_event_target_ec2" {
    target_id = "cw_ec2_events_target"
    rule = aws_cloudwatch_event_rule.cw_rule_ec2_events.id
    arn = var.event_sns_arn
}