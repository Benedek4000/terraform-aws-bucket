output "bucket" {
  value = aws_s3_bucket.bucket
}

output "bucketOwnershipControl" {
  value = aws_s3_bucket_ownership_controls.bucket
}

output "lifecycleConfiguration" {
  value = aws_s3_bucket_lifecycle_configuration.versioningBucketConfig
}
