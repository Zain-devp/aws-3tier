resource "aws_s3_bucket" "my_bucket" {
  bucket = "zain-app-storage-bucket-2026"

  tags = {
    Name        = "Zain-S3-Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}