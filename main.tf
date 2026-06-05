# Source Bucket (Mumbai)
resource "aws_s3_bucket" "source" {
  bucket = "terraform-crr-source-2026"
}

# Destination Bucket (Singapore)
resource "aws_s3_bucket" "destination" {
  provider = aws.singapore
  bucket   = "terraform-crr-destination-2026"
}

# Versioning Source
resource "aws_s3_bucket_versioning" "source_versioning" {
  bucket = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Versioning Destination
resource "aws_s3_bucket_versioning" "destination_versioning" {
  provider = aws.singapore
  bucket   = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

# IAM Role for Replication
resource "aws_iam_role" "replication" {
  name = "s3-replication-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for Replication
resource "aws_iam_policy" "replication_policy" {
  name        = "s3-replication-policy"
  description = "Policy for S3 cross-region replication"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectLegalHold",
          "s3:GetObjectRetention"
        ]
        Resource = "${aws_s3_bucket.source.arn}/*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags",
          "s3:PutObjectVersionAcl",
          "s3:PutObjectLegalHold",
          "s3:PutObjectRetention"
        ]
        Resource = "${aws_s3_bucket.destination.arn}/*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "replication_attach" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication_policy.arn
}

# Replication Configuration (single block, with mandatory delete_marker_replication)
resource "aws_s3_bucket_replication_configuration" "replication" {
  bucket = aws_s3_bucket.source.id
  role   = aws_iam_role.replication.arn

  rule {
    id     = "replication-rule"
    status = "Enabled"

    filter {
      prefix = ""
    }

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }

    delete_marker_replication {
      status = "Disabled"
    }
  }
}
