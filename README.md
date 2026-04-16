# 📚 Terraform AWS Library
Bibliothèque de ressources Terraform AWS documentées pas à pas, 
conçue pour apprendre et comprendre chaque service AWS en le déployant concrètement.

## 🎯 Objectif
Ce projet est né de ma reconversion professionnelle vers le Cloud Engineering.
L'idée est simple : documenter chaque ressource AWS en Terraform de façon 
suffisamment claire pour qu'un débutant complet puisse la comprendre et la déployer.

## 🗂️ Structure du projet
Chaque dossier correspond à un service AWS avec :
- `main.tf` → le code Terraform
- `variables.tf` → les paramètres configurables
- `outputs.tf` → les informations retournées après déploiement
- `README.md` → explication détaillée du service et du code

## 📦 Modules

### 👤 IAM
| Module | Description |
|--------|-------------|
| [create-user](./iam/create-user) | Crée un utilisateur IAM avec tags |

### 💻 Compute
| Module | Description |
|--------|-------------|
| [create-ec2-instance](./compute/create-ec2-instance) | Crée une instance EC2 avec Security Group, rôle IAM et accès SSM |

### 🗄️ Storage
| Module | Description |
|--------|-------------|
| [create-bucket](./storage/create-bucket) | Crée un bucket S3 avec versioning et block public access |

### 🌐 Network
🚧 En construction

### 🗃️ Database
🚧 En construction

## 🛠️ Prérequis
- Compte AWS
- Terraform installé
- AWS CLI configuré

## 👤 Auteur
**Jimmy Barbier** — Cloud Engineer en reconversion
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Jimmy_Barbier-blue?logo=linkedin)](https://www.linkedin.com/in/jimmy-barbier-89740539a/)
[![Portfolio](https://img.shields.io/badge/Portfolio-jimmy--barbier.github.io-informational)](https://jimmy-barbier.github.io/portfolio/)

## 📝 Notes
Ce projet évolue au fur et à mesure de mon apprentissage.
Chaque module est ajouté et documenté après avoir été compris et testé.
