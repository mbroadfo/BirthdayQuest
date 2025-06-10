terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-west-2" # or your preferred region
}

resource "aws_s3_bucket" "birthday_quest_bucket" {
  bucket = "susan-birthday-quest-uniqueid" # Change to globally unique bucket name

  force_destroy = true # allows terraform destroy to clean up even if objects exist

  tags = {
    Name = "Susan Birthday Quest"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.birthday_quest_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.birthday_quest_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.birthday_quest_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.birthday_quest_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.birthday_quest_bucket.id
  key    = "index.html"
  source = "${path.module}/../html/index.html"
  content_type = "text/html"
}
