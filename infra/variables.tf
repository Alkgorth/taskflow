variable "ghcr_owner" {
  description = "Propriétaire GitHub (en minuscules) pour ghcr.io"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.ghcr_owner))
    error_message = "ghcr_owner doit contenir uniquement des minuscules, chiffres ou tirets."
  }
}

variable "image_tag" {
  description = "Tag des images Docker (SHA court de 7 caractères hexadécimaux ou latest)"
  type        = string
  default     = "latest"

  validation {
    condition     = var.image_tag == "latest" || can(regex("^[0-9a-f]{7}$", var.image_tag))
    error_message = "image_tag doit être 'latest' ou un SHA court de 7 caractères hexadécimaux."
  }
}

variable "front_port" {
  description = "Port externe exposé pour le frontend"
  type        = number
  default     = 8081

  validation {
    condition     = var.front_port >= 1024 && var.front_port <= 65535
    error_message = "front_port doit être compris entre 1024 et 65535."
  }
}

variable "environment" {
  description = "Nom de l'environnement déployé"
  type        = string
  default     = "staging"
}

variable "db_password" {
  description = "Mot de passe PostgreSQL (généré aléatoirement si null)"
  type        = string
  default     = null
  sensitive   = true
}

variable "ghcr_username" {
  description = "Nom d'utilisateur pour l'authentification ghcr.io"
  type        = string
  default     = null
}

variable "ghcr_token" {
  description = "Token d'accès pour l'authentification ghcr.io"
  type        = string
  default     = null
  sensitive   = true
}
