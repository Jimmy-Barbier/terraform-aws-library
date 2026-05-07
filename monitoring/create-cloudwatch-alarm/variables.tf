# -------------------------------------------------------
# Alarme
# -------------------------------------------------------
variable "alarm_name" {
  description = "Nom de l'alarme CloudWatch"
  type        = string
}

variable "alarm_description" {
  description = "Description de l'alarme"
  type        = string
  default     = ""
}

variable "comparison_operator" {
  description = "Opérateur de comparaison (ex: GreaterThanThreshold, LessThanThreshold)"
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  description = "Nombre de périodes consécutives à évaluer avant de déclencher l'alarme"
  type        = number
  default     = 2
}

variable "metric_name" {
  description = "Nom de la métrique surveillée (ex: CPUUtilization)"
  type        = string
}

variable "namespace" {
  description = "Namespace AWS de la métrique (ex: AWS/EC2, AWS/RDS)"
  type        = string
}

variable "period" {
  description = "Durée d'une période en secondes (ex: 300 = 5 minutes)"
  type        = number
  default     = 300
}

variable "statistic" {
  description = "Statistique utilisée (Average, Sum, Maximum, Minimum)"
  type        = string
  default     = "Average"
}

variable "threshold" {
  description = "Valeur seuil qui déclenche l'alarme"
  type        = number
}

variable "treat_missing_data" {
  description = "Comportement si données manquantes (missing, ignore, breaching, notBreaching)"
  type        = string
  default     = "missing"
}

variable "dimensions" {
  description = "Dimensions pour cibler une ressource précise (ex: { InstanceId = 'i-1234' })"
  type        = map(string)
  default     = {}
}

# -------------------------------------------------------
# Notification
# -------------------------------------------------------
variable "alert_email" {
  description = "Adresse email qui recevra les notifications"
  type        = string
}

# -------------------------------------------------------
# Tags
# -------------------------------------------------------
variable "tags" {
  description = "Tags appliqués aux ressources"
  type        = map(string)
  default     = {}
}