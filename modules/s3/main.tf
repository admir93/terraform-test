# Create s3 bucket for static content
resource "aws_s3_bucket" "s3_bucket_static" {
  bucket = "${var.environment}-${var.project}.hotreboot.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}

# grant user access to bucket
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.s3_bucket_static.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {"AWS":"${var.user_arn}"},
      "Action": [ "s3:*" ],
      "Resource": [
        "${aws_s3_bucket.s3_bucket_static.arn}",
        "${aws_s3_bucket.s3_bucket_static.arn}/*"
      ]
    }
  ]
}
EOF
}