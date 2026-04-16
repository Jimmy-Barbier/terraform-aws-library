variable "instance_name" {
  description = "Nom de l'instance EC2 (utilisé pour nommer toutes les ressources associées)"
  type        = string
}
variable "instance_type" {
  description = "Type d'instance EC2 (ex: t2.micro, t3.small)"
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "ID de l'AMI à utiliser. Laisser vide pour utiliser automatiquement Amazon Linux 2023"
  type        = string
  default     = ""
}
variable "root_volume_size" {
  description = "Taille du volume racine en Go"
  type        = number
  default     = 20

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 500
    error_message = "La taille du volume doit être entre 8 et 500 Go."
  }
}
variable "vpc_id" {
  description = "ID du VPC dans lequel déployer l'instance"
  type        = string
}
variable "subnet_id" {
  description = "ID du subnet dans lequel déployer l'instance"
  type        = string
}
variable "allowed_ports" {
  description = "Liste des ports entrants autorisés dans le Security Group"
  type        = list(number)
  default     = [80, 443]
}
variable "allowed_cidr_blocks" {
  description = "Liste des blocs CIDR autorisés pour les règles ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "user_data" {
  description = "Script de démarrage personnalisé. Laisser vide pour utiliser le script Apache par défaut"
  type        = string
  default     = ""
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