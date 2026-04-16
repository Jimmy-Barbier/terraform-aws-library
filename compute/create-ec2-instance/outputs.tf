output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Adresse IP publique de l'instance"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "Adresse IP privée de l'instance"
  value       = aws_instance.this.private_ip
}
output "security_group_id" {
  description = "ID du Security Group associé à l'instance"
  value       = aws_security_group.this.id
}

output "iam_role_arn" {
  description = "ARN du rôle IAM attaché à l'instance"
  value       = aws_iam_role.this.arn
}

output "ami_used" {
  description = "ID de l'AMI utilisée pour créer l'instance"
  value       = aws_instance.this.ami
}