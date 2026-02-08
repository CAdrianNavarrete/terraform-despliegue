resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}



resource "azurerm_container_app_environment" "cae" {
  name                = local.cae_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "app" {
  name                         = local.ca_name
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = var.container_port
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "app"
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
    }

    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    http_scale_rule {
      name                = "http-rule"
      concurrent_requests = 50
    }
  }
}



