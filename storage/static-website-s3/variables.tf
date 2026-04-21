variable "bucket_name" {
  description = "Nom du bucket S3 (doit être unique globalement sur AWS)"
  type        = string
}

variable "index_document" {
  description = "Nom du fichier HTML de la page principale"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Nom du fichier HTML affiché en cas d'erreur (page 404)"
  type        = string
  default     = "error.html"
}

variable "tags" {
  description = "Tags appliqués à toutes les ressources. Les clés Project, Environment, Owner et CostCenter sont obligatoires."
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      contains(keys(var.tags), "Project"),
      contains(keys(var.tags), "Environment"),
      contains(keys(var.tags), "Owner"),
      contains(keys(var.tags), "CostCenter"),
    ])
    error_message = "Les tags obligatoires sont : Project, Environment, Owner, CostCenter."
  }
}