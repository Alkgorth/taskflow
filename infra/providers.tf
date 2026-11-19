provider "docker" {
  dynamic "registry_auth" {
    for_each = var.ghcr_token != null && var.ghcr_token != "" ? [1] : []
    content {
      address  = "ghcr.io"
      username = var.ghcr_username
      password = var.ghcr_token
    }
  }
}
