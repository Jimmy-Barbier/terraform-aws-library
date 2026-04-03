output "user_name" {
  description = "Nom de l'utilisateur IAM créé"
  value       = aws_iam_user.this.name
}

output "user_arn" {
  description = "ARN de l'utilisateur IAM créé"
  value       = aws_iam_user.this.arn
}