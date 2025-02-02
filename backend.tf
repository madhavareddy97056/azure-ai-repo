terraform {
  backend "azurerm" {
    resource_group_name   = "tf-backend-remote-state-rg"
    storage_account_name  = "tfbackendstorageacct"
    container_name        = "remotestate"
    key                   = "terraform.tfstate"
    
    # use_azuread_auth      = true
    # client_id             = "74cd3749-2d70-4ca8-b51d-f0da39520c21"  # Your Service Principal Client ID
    # client_secret         = "iaO8Q~xfHC7PLsMtgPUg1lhWRUJ-d1wgbmIqEamT"      # Your Service Principal Secret
    # tenant_id             = "03273300-90fd-446d-a8f8-e63a3ab71ec0"
  }
}
