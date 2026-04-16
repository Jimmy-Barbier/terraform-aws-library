![Terraform](https://img.shields.io/badge/Terraform-v1.0+-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws)
![Status](https://img.shields.io/badge/Status-Testé-success)

# 🖥️ Compute – Créer une instance EC2

## 📋 Description

Ce module Terraform crée une instance EC2 sur AWS avec toutes les ressources associées :
Security Group, rôle IAM, Instance Profile et script de démarrage (User Data).

L'accès se fait via **AWS Systems Manager (SSM)** — le port SSH (22) est fermé par défaut pour limiter la surface d'attaque.

## 📁 Structure du module

```
create-ec2-instance/
├── main.tf           # Définit les ressources AWS à créer (EC2, SG, IAM)
├── variables.tf      # Déclare les paramètres configurables
├── outputs.tf        # Retourne les informations après déploiement
├── terraform.tfvars  # Tes valeurs personnelles — à adapter avant de lancer
└── assets/           # Screenshots de démonstration
```

## 🛠️ Prérequis

- Compte AWS actif
- AWS CLI installé et configuré (`aws configure`)
- Terraform installé (v1.0+)
- Un VPC et un subnet existants (le VPC par défaut de ton compte AWS suffit pour tester)

## 📥 Installation

```bash
git clone https://github.com/Jimmy-Barbier/terraform-aws-library.git
cd terraform-aws-library/compute/create-ec2-instance
```

## ⚙️ Configuration

Édite le fichier `terraform.tfvars` avec tes valeurs :

```hcl
instance_name = "mon-serveur-web"
instance_type = "t2.micro"
vpc_id        = "vpc-xxxxxxxxxxxxxxxxx"
subnet_id     = "subnet-xxxxxxxxxxxxxxxxx"

tags = {
  Project     = "terraform-aws-library"
  Environment = "dev"
  Owner       = "jim-test"
  CostCenter  = "formation"
}
```

## 🚀 Déploiement

```bash
# 1. Initialiser Terraform
terraform init

# 2. Vérifier ce qui va être créé
terraform plan

# 3. Créer l'instance
terraform apply
```

## ✅ Résultat

### terraform apply
![terraform apply](./assets/terraform-apply-ec2.png)

### Vérification dans la console AWS
![console AWS](./assets/ec2-console-jim-test.png)

## 🗑️ Nettoyage

```bash
terraform destroy
```

⚠️ Cette commande supprime toutes les ressources créées par ce module.
À utiliser avec précaution en production.

## 📝 Notes

- Le port **SSH (22) est fermé** par défaut — accès via **AWS Systems Manager** uniquement
- Le volume racine est **chiffré** par défaut (`encrypted = true`)
- L'AMI est **auto-détectée** : si `ami_id` est laissé vide, Terraform récupère automatiquement la dernière Amazon Linux 2023 disponible dans ta région
- Les tags `Project`, `Environment`, `Owner` et `CostCenter` sont **obligatoires** — Terraform refusera de continuer s'ils sont absents

## 📊 Variables

| Nom | Description | Type | Obligatoire |
|-----|-------------|------|-------------|
| `instance_name` | Nom de l'instance et des ressources associées | string | ✅ |
| `instance_type` | Type d'instance EC2 | string | ❌ |
| `ami_id` | ID de l'AMI (vide = Amazon Linux 2023 auto) | string | ❌ |
| `root_volume_size` | Taille du volume racine en Go | number | ❌ |
| `vpc_id` | ID du VPC cible | string | ✅ |
| `subnet_id` | ID du subnet cible | string | ✅ |
| `allowed_ports` | Ports entrants ouverts dans le Security Group | list(number) | ❌ |
| `allowed_cidr_blocks` | CIDR autorisés pour le Security Group | list(string) | ❌ |
| `user_data` | Script de démarrage personnalisé | string | ❌ |
| `tags` | Tags (Project, Environment, Owner, CostCenter obligatoires) | map(string) | ✅ |

## 📤 Outputs

| Nom | Description |
|-----|-------------|
| `instance_id` | ID de l'instance EC2 |
| `instance_public_ip` | Adresse IP publique |
| `instance_private_ip` | Adresse IP privée |
| `security_group_id` | ID du Security Group |
| `iam_role_arn` | ARN du rôle IAM |
| `ami_used` | ID de l'AMI utilisée |