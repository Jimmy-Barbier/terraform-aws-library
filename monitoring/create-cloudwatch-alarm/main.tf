# -------------------------------------------------------
# SNS Topic (pour recevoir les notifications de l'alarme)
# -------------------------------------------------------
resource "aws_sns_topic" "this" {
  name = "${var.alarm_name}-topic"

  tags = var.tags
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# -------------------------------------------------------
# CloudWatch Alarm
# -------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.alarm_name
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  treat_missing_data  = var.treat_missing_data

  dimensions = var.dimensions

  alarm_actions = [aws_sns_topic.this.arn]
  ok_actions    = [aws_sns_topic.this.arn]

  tags = var.tags
}