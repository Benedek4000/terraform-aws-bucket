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

variable "enableVersioning" {
  type        = bool
  default     = false
  description = "Enables bucket versioning."
}

variable "customPolicy" {
  description = "Custom bucket policy."
  default     = null
}
