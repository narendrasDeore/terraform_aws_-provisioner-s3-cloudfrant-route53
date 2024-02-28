resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    # error_document = "error.html"
  }

  tags = {
    Name = var.bucket_name
  }
}


resource "aws_s3_bucket_public_access_block" "s3_public" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website.id

policy = jsonencode({
    "Version": "2012-10-17",
    # "Id": "Policy1699345574358",
    "Statement": [
      {
        "Sid": "AllowPublicRead",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

output "s3_bucket_website_endpoint" {
  value = "http://${aws_s3_bucket.static_website.website_endpoint}"
}



