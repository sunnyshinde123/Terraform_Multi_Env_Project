resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-s3-ss-bucket"

  tags = {
    Name = "${var.env}-s3-ss-bucket"
    Environment = var.env
  }
}