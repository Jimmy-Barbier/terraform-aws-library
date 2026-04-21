output "bucket_name" {
  description = "Nom du bucket S3"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN du bucket S3"
  value       = aws_s3_bucket.this.arn
}

output "website_url" {
  description = "URL publique du site statique"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}