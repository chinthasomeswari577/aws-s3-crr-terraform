# variables.tf

# -------------------------------
# S3 Bucket Variables
# -------------------------------
variable "source_bucket_name" {
  description = "Name of the source S3 bucket"
  type        = string
  default     = "terraform-crr-source-2026"
}

variable "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  type        = string
  default     = "terraform-crr-destination-2026"
}

variable "source_region" {
  description = "Region of the source bucket"
  type        = string
  default     = "ap-south-1" # Mumbai
}

variable "destination_region" {
  description = "Region of the destination bucket"
  type        = string
  default     = "ap-southeast-1" # Singapore
}

# -------------------------------
# IAM Role & Policy Variables
# -------------------------------
variable "replication_role_name" {
  description = "Name of the IAM role used for replication"
  type        = string
  default     = "s3-replication-role"
}

variable "replication_policy_name" {
  description = "Name of the IAM policy attached to the replication role"
  type        = string
  default     = "s3-replication-policy"
}

# -------------------------------
# Replication Rule Variables
# -------------------------------
variable "replication_rule_id" {
  description = "ID for the replication rule"
  type        = string
  default     = "replication-rule"
}
