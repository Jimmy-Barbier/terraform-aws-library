variable "user_name" {
  description = "Nom de l'utilisateur IAM à créer"
  type        = string
}

variable "tags" {
  description = "Tags à appliquer à l'utilisateur"
  type        = map(string)
  default     = {}
}