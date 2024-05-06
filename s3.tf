resource "aws_s3_bucket" "static_bucket" {
  bucket = "${var.name}-${var.environment}"
}
