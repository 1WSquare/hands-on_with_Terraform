terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.3.0"
    }
  }
  cloud {
    organization = "w2"

    workspaces {
      name = "Hands-On_with_Terraform"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-c923564a-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "secstg" {
  source               = "app.terraform.io/w2/secstg/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "gusecstgname010203"
}