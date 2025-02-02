terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
subscription_id = "452a61db-7b20-478f-8168-0decae76761f"

}

