output "bucket" {
  value = aws_s3_bucket.bucket
}

output "bucketOwnershipControl" {
  value = aws_s3_bucket_ownership_controls.bucket
}
