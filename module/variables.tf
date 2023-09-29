variable "bucketName" {
  type        = string
  description = "Name of the S3 bucket."
}

variable "principalType" {
  type        = string
  description = "Default bucket policy (full access) principal type."
}

variable "principalIdentifiers" {
  type        = list(string)
  description = "Default bucket policy (full access) principal identifiers."
}

variable "forceDestroy" {
  type        = bool
  default     = false
  description = "Destroy the bucket if not empty."
}

variable "versioningConfig" {
  type        = map(any)
  default     = {}
  description = "Versioning configuration."
}

variable "customPolicy" {
  description = "Custom bucket policy."
  default     = null
}
