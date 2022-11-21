terraform {
  required_version = ">= 1.1.7"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    version = "3.32.0" }
  }
}

provider "azurerm" {
  features {}
}



# Resource group
resource "azurerm_resource_group" "pseudo-rg" {
  name     = "pseudo-rg"
  location = var.location
}

# App plan
resource "azurerm_service_plan" "pseudo-plan" {
  name                = "pseudo-plan"
  location            = azurerm_resource_group.pseudo-rg.location
  resource_group_name = azurerm_resource_group.pseudo-rg.name
  sku_name            = "F1"
  os_type             = "Linux"
}

# App service
resource "azurerm_linux_web_app" "pseudo-app" {
  name                = "pseudo-app"
  resource_group_name = azurerm_resource_group.pseudo-rg.name
  location            = azurerm_resource_group.pseudo-rg.location
  service_plan_id     = azurerm_service_plan.pseudo-plan.id
  site_config {
    always_on = false
    http2_enabled = true
    application_stack {
      docker_image     = "lukasljl/pseudo-project"
      docker_image_tag = "latest"
    }
  }
  app_settings = {
    "WEBSITES_PORT" = "5000"
  }
}
