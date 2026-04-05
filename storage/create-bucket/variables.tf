variable "bucket_name" {
  description = "Nom du bucket S3 à créer"
  type        = string
}

variable "versioning" {
  description = "Activer le versioning sur le bucket"
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Bloquer l'accès public au bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags à appliquer au bucket"
  type        = map(string)
  default     = {}
}