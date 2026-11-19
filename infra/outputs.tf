output "url" {
  description = "URL d'accès au frontend"
  value       = "http://localhost:${var.front_port}"
}

output "health_url" {
  description = "URL de vérification de santé de l'API via le front"
  value       = "http://localhost:${var.front_port}/health"
}

output "image_tag" {
  description = "Tag des images déployées"
  value       = var.image_tag
}

output "containers" {
  description = "Noms des conteneurs créés"
  value = {
    db    = docker_container.db.name
    api   = docker_container.api.name
    front = docker_container.front.name
  }
}

output "network" {
  description = "Nom du réseau Docker"
  value       = docker_network.this.name
}
