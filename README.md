# Terraform AWS S3 Bucket Module

TODO:

-   write more tests

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | <= 5.16 |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | <= 5.16 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                              | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)                                                                                     | resource    |
| [aws_s3_bucket_lifecycle_configuration.versioningBucketConfig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)                     | resource    |
| [aws_s3_bucket_ownership_controls.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls)                                               | resource    |
| [aws_s3_bucket_policy.customPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)                                                                 | resource    |
| [aws_s3_bucket_policy.defaultPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)                                                                | resource    |
| [aws_s3_bucket_public_access_block.publicAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)                                       | resource    |
| [aws_s3_bucket_server_side_encryption_configuration.bucketEncryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource    |
| [aws_s3_bucket_versioning.bucketVersioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)                                                     | resource    |
| [aws_iam_policy_document.S3FullAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                                                        | data source |

## Inputs

| Name                                                                                          | Description                                                | Type           | Default | Required |
| --------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_bucketName"></a> [bucketName](#input_bucketName)                               | Name of the S3 bucket.                                     | `string`       | n/a     |   yes    |
| <a name="input_customPolicy"></a> [customPolicy](#input_customPolicy)                         | Custom bucket policy.                                      | `any`          | n/a     |   yes    |
| <a name="input_enableVersioning"></a> [enableVersioning](#input_enableVersioning)             | Enables bucket versioning.                                 | `bool`         | `false` |    no    |
| <a name="input_forceDestroy"></a> [forceDestroy](#input_forceDestroy)                         | Destroy the bucket if not empty.                           | `bool`         | `false` |    no    |
| <a name="input_principalIdentifiers"></a> [principalIdentifiers](#input_principalIdentifiers) | Default bucket policy (full access) principal identifiers. | `list(string)` | n/a     |   yes    |
| <a name="input_principalType"></a> [principalType](#input_principalType)                      | Default bucket policy (full access) principal type.        | `string`       | n/a     |   yes    |

## Outputs

| Name                                                  | Description |
| ----------------------------------------------------- | ----------- |
| <a name="output_bucket"></a> [bucket](#output_bucket) | n/a         |

<!-- END_TF_DOCS -->
