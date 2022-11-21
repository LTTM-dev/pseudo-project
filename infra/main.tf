terraform {
  required_version = ">= 1.1.7"
}

provider "azurerm" {
  features {}
}

module "app-service" {
  source   = "./modules/app-service"
  location = "West Europe"
  app-name = "pseudo-app"
}
