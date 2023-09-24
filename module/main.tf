data "aws_iam_policy_document" "S3FullAccess" {
  statement {
    principals {
      type        = var.principalType
      identifiers = var.principalIdentifiers
    }

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = ["s3:*"]
    effect  = "Deny"
    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
  }
}

resource "aws_s3_bucket_policy" "defaultPolicy" {
  count  = var.customPolicy == null ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.S3FullAccess.json
}

resource "aws_s3_bucket_policy" "customPolicy" {
  count  = var.customPolicy == null ? 0 : 1
  bucket = aws_s3_bucket.bucket.id
  policy = var.customPolicy
}

resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucketName
  force_destroy = var.forceDestroy
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "publicAccess" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bucketVersioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.enableVersioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucketEncryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioningBucketConfig" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "config"
    status = aws_s3_bucket_versioning.bucketVersioning.versioning_configuration[0].status

    noncurrent_version_expiration {
      newer_noncurrent_versions = 7
      noncurrent_days           = 7
    }
  }
}
