terraform {
    required_version = ">= 0.15.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest
      version = "=2.46.0"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      # https://registry.terraform.io/providers/aztfmod/azurecaf/latest
      version = "1.2.3"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "random" {}