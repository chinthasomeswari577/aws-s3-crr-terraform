# -------------------------------
# S3 Bucket Outputs
# -------------------------------

output "source_bucket_name" {
  description = "Name of the source S3 bucket"
  value       = aws_s3_bucket.source.bucket
}

output "source_bucket_arn" {
  description = "ARN of the source S3 bucket"
  value       = aws_s3_bucket.source.arn
}

output "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  value       = aws_s3_bucket.destination.bucket
}

output "destination_bucket_arn" {
  description = "ARN of the destination S3 bucket"
  value       = aws_s3_bucket.destination.arn
}

# -------------------------------
# Versioning Outputs
# -------------------------------

output "source_versioning_status" {
  description = "Versioning status of source bucket"
  value       = aws_s3_bucket_versioning.source_versioning.versioning_configuration[0].status
}

output "destination_versioning_status" {
  description = "Versioning status of destination bucket"
  value       = aws_s3_bucket_versioning.destination_versioning.versioning_configuration[0].status
}

# -------------------------------
# IAM Outputs
# -------------------------------

output "replication_role_name" {
  description = "Name of IAM replication role"
  value       = aws_iam_role.replication.name
}

output "replication_role_arn" {
  description = "ARN of IAM replication role"
  value       = aws_iam_role.replication.arn
}

output "replication_policy_arn" {
  description = "ARN of IAM replication policy"
  value       = aws_iam_policy.replication_policy.arn
}

output "replication_policy_id" {
  description = "ID of IAM replication policy"
  value       = aws_iam_policy.replication_policy.id
}

# -------------------------------
# Replication Configuration Output
# -------------------------------

output "replication_rule_id" {
  description = "Replication rule ID"
  value       = aws_s3_bucket_replication_configuration.replication.id
}