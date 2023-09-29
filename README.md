# Terraform AWS S3 Bucket Module

TODO:

-   write more tests

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | <= 5.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | <= 5.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.versioningBucketConfig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_ownership_controls.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.customPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.defaultPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.publicAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucketEncryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucketVersioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.S3FullAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucketName"></a> [bucketName](#input\_bucketName) | Name of the S3 bucket. | `string` | n/a | yes |
| <a name="input_customPolicy"></a> [customPolicy](#input\_customPolicy) | Custom bucket policy. | `any` | `null` | no |
| <a name="input_forceDestroy"></a> [forceDestroy](#input\_forceDestroy) | Destroy the bucket if not empty. | `bool` | `false` | no |
| <a name="input_principalIdentifiers"></a> [principalIdentifiers](#input\_principalIdentifiers) | Default bucket policy (full access) principal identifiers. | `list(string)` | n/a | yes |
| <a name="input_principalType"></a> [principalType](#input\_principalType) | Default bucket policy (full access) principal type. | `string` | n/a | yes |
| <a name="input_versioningConfig"></a> [versioningConfig](#input\_versioningConfig) | Versioning configuration. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | n/a |
| <a name="output_bucketOwnershipControl"></a> [bucketOwnershipControl](#output\_bucketOwnershipControl) | n/a |
| <a name="output_lifecycleConfiguration"></a> [lifecycleConfiguration](#output\_lifecycleConfiguration) | n/a |
<!-- END_TF_DOCS -->
