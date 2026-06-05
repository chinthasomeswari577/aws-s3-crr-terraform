# outputs.tf

# -------------------------------
# S3 Bucket Outputs
# -------------------------------
output "source_bucket_arn" {
  description = "ARN of the source bucket"
  value       = aws_s3_bucket.source.arn
}

output "destination_bucket_arn" {
  description = "ARN of the destination bucket"
  value       = aws_s3_bucket.destination.arn
}

output "source_bucket_name" {
  description = "Name of the source bucket"
  value       = aws_s3_bucket.source.bucket
}

output "destination_bucket_name" {
  description = "Name of the destination bucket"
  value       = aws_s3_bucket.destination.bucket
}

# -------------------------------
# IAM Role & Policy Outputs
# -------------------------------
output "replication_role_arn" {
  description = "ARN of the IAM role used for replication"
  value       = aws_iam_role.replication.arn
}

output "replication_policy_id" {
  description = "ID of the IAM policy attached to the replication role"
  value       = aws_iam_policy.replication.id
}

# -------------------------------
# Replication Rule Outputs
# -------------------------------
output "replication_rule_id" {
  description = "ID of the replication rule"
  value       = aws_s3_bucket_replication_configuration.replication.rule[0].id
}


/*source_bucket_arn = arn:aws:s3:::terraform-crr-source-2026
destination_bucket_arn = arn:aws:s3:::terraform-crr-destination-2026
replication_role_arn = arn:aws:iam::123456789012:role/s3-replication-role
replication_rule_id = replication-rule*/