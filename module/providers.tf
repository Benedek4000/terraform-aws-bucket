terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.16" # allow 5.18 or higher once 5.18 is released
    }
  }
}
