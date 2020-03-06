variable "dstrct" {
}
resource "aws_s3_bucket" "s3_for_backend" {
  bucket = "s3-to-store-state-99jnlk"
  versioning {
      enabled = true
  }

  force_destroy = "${var.dstrct}"
}
