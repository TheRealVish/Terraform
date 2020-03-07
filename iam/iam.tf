variable "newUserName" {
}
resource "aws_iam_user" "secAdmin" {
  name = var.newUserName
}
resource "aws_iam_policy" "ec2policy" {
  name = "secAdminPolicy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteTags",
                "ec2:DescribeTags",
                "ec2:DescribeVpnConnections",
                "ec2:CreateTags",
                "ec2:GetEbsEncryptionByDefault",
                "ec2:GetCapacityReservationUsage",
                "ec2:DescribeVolumesModifications",
                "ec2:GetHostReservationPurchasePreview",
                "ec2:DescribeFastSnapshotRestores",
                "ec2:GetConsoleScreenshot",
                "ec2:GetReservedInstancesExchangeQuote",
                "ec2:GetConsoleOutput",
                "ec2:GetPasswordData",
                "ec2:GetLaunchTemplateData",
                "ec2:DescribeScheduledInstances",
                "ec2:DescribeScheduledInstanceAvailability",
                "ec2:GetEbsDefaultKmsKeyId",
                "ec2:DescribeElasticGpus"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}
resource "aws_iam_policy_attachment" "policyBind" {
  name = "policybind"
  users = [aws_iam_user.secAdmin.name]
  policy_arn = aws_iam_policy.ec2policy.arn
}
