resource "aws_s3_bucker" "poc_s3_store_state" {
  bucket = "poc_s3_store_state_88f0n8f"
  versioning = {
      enabled = true
  }

  #non-prod poc destroy flag
  force_destroy = true
}
