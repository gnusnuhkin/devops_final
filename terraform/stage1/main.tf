terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-acmp-final"
    storage_account_name = "acmp2400storageaccount"
    container_name       = "big-tf-state-acmp2400"
    key                  = "nsung"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "nsung_acr" {
  name                = "acrnsungacmp2400"
  resource_group_name = "rg-nsung"
  location            = "Central US"
  sku                 = "Basic"
  admin_enabled       = false
}