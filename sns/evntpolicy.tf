resource "aws_sns_topic_policy" "default" {
  arn = "${aws_sns_topic.publish_user_events.arn}"
  policy = "${data.aws_iam_policy_document.event_sns_policy.json}"
}
data "aws_iam_policy_document" "event_sns_policy" {
    statement {
        effect = "Allow"
        actions = ["SNS:Publish"]
        principals {
            type = "Service"
            identifiers = ["events.amazonaws.com"]
        }
        resources = ["${aws_sns_topic.publish_user_events.arn}"]
    }
}