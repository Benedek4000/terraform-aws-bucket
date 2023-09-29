terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

##### TESTS #####

module "versioning" {
  source = "../../module"

  bucketName           = "test-versioning-1234"
  principalType        = "Service"
  principalIdentifiers = ["ec2.amazonaws.com"]
  versioningConfig = {
    newer_noncurrent_versions = 1
    noncurrent_days           = 1
  }
}

resource "test_assertions" "tests" {
  component = "versioning"

  equal "bucketName" {
    description = "bucket name"
    got         = module.versioning.bucket.bucket
    want        = "test-versioning-1234"
  }

  equal "forceDestroy" {
    description = "force destroy"
    got         = module.versioning.bucket.force_destroy
    want        = false
  }

  equal "objectOwnership" {
    description = "object ownership"
    got         = module.versioning.bucketOwnershipControl.rule[0].object_ownership
    want        = "BucketOwnerEnforced"
  }

  equal "newerNoncurrentVersions" {
    description = "newer noncurrent versions"
    got         = module.versioning.lifecycleConfiguration.rule[0].noncurrent_version_expiration[0].newer_noncurrent_versions
    want        = "1"
  }

  equal "noncurrentDays" {
    description = "oncurrent days"
    got         = module.versioning.lifecycleConfiguration.rule[0].noncurrent_version_expiration[0].noncurrent_days
    want        = 1
  }
}

