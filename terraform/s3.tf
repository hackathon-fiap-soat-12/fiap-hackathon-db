resource "aws_s3_bucket" "video_file_store" {
  bucket = "video-file-store-${data.aws_caller_identity.current.account_id}"

  force_destroy = true
}
