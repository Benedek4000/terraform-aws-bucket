terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

##### TESTS #####

module "basic" {
  source = "../../module"

  bucketName           = "test-basic"
  principalType        = "Service"
  principalIdentifiers = ["ec2.amazonaws.com"]
}

resource "test_assertions" "tests" {
  component = "basic"

  equal "bucketName" {
    description = "bucket name"
    got         = module.basic.bucket.bucket
    want        = "test-basic"
  }

  equal "forceDestroy" {
    description = "force destroy"
    got         = module.basic.bucket.force_destroy
    want        = false
  }

  equal "objectOwnership" {
    description = "object ownership"
    got         = module.basic.bucketOwnershipControl.rule[0].object_ownership
    want        = "BucketOwnerEnforced"
  }
}

