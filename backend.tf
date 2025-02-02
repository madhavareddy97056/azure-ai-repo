terraform {
  backend "azurerm" {
    resource_group_name   = "tf-backend-remote-state-rg"
    storage_account_name  = "tfbackendstorageacct"
    container_name        = "remotestate"
    key                   = "terraform.tfstate"
  }
}
