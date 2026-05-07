output "alarm_arn" {
  description = "ARN de l'alarme CloudWatch"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "alarm_name" {
  description = "Nom de l'alarme CloudWatch"
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}

output "sns_topic_arn" {
  description = "ARN du topic SNS utilisé pour les notifications"
  value       = aws_sns_topic.this.arn
}