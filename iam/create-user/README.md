# IAM User – Terraform Module

## Description
Ce module crée un utilisateur IAM sur AWS avec des tags configurables.

## Prérequis
- Terraform installé
- AWS CLI configuré avec les bonnes permissions

## Variables
| Nom | Description | Type | Obligatoire |
|-----|-------------|------|-------------|
| user_name | Nom de l'utilisateur IAM | string | ✅ |
| tags | Tags à appliquer | map(string) | ❌ |

## Outputs
| Nom | Description |
|-----|-------------|
| user_name | Nom de l'utilisateur créé |
| user_arn | ARN de l'utilisateur créé |

## Exemple d'utilisation
```hcl
module "iam_user" {
  source    = "./iam/create-user"
  user_name = "jim.test"
  tags = {
    Environment = "prod"
    Owner       = "jimmy"
  }
}
```

## Déploiement
```bash
terraform init
terraform plan
terraform apply
```

## ⚠️ Accès Console
Ce module crée l'utilisateur IAM sans accès console. 
Pour activer l'accès console deux options :

**Option 1 — Manuellement (simple)**
IAM → Users → Security credentials → Enable console access
L'admin définit un mot de passe temporaire et force le changement à la première connexion.

**Option 2 — AWS IAM Identity Center (bonne pratique entreprise)**
L'utilisateur reçoit un email automatique pour définir son mot de passe.
Zéro intervention admin, recommandé pour les environnements multi-utilisateurs.