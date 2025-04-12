resource "aws_s3_bucket" "video_file_store" {
  bucket = "fiap-alquimia-dos-frames"

  force_destroy = true
}


resource "aws_s3_bucket_cors_configuration" "cors_rules" {
  bucket = aws_s3_bucket.video_file_store.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag", "x-amz-meta-content-type"]
    max_age_seconds = 3000
  }
}