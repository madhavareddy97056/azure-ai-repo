# Create a resource group
resource "azurerm_resource_group" "openai_rg" {
  name     = "openai-resource-group-madhava-tf"
  location = "East US"
}

# Create an Azure OpenAI service
resource "azurerm_cognitive_account" "openai_services" {
  name                = "myopenaiservice-tf-new2"
  location            = azurerm_resource_group.openai_rg.location
  resource_group_name = azurerm_resource_group.openai_rg.name
  kind                = "OpenAI"
  sku_name            = "S0"
  custom_subdomain_name = "myopenaiservice-madhava2"

  network_acls {
    default_action = "Allow"
  }
}

# # Deploy an OpenAI Model (e.g., GPT-4)
# resource "azurerm_cognitive_deployment" "openai_deployment-mini" {
#   name                 = "gpt4-mini"
#   cognitive_account_id = azurerm_cognitive_account.openai_service.id
#   model {
#     format  = "OpenAI"
#     name    = "gpt-4-turbo"
#     version = "1106"
#   }
#   sku {
#     name = "Standard"
#     capacity = 2
#   }
# }


# Deploy an OpenAI Model (e.g., GPT-4 turbo)
resource "azurerm_cognitive_deployment" "openai_deployment4" {
  name                 = "gpt-4"
  cognitive_account_id = azurerm_cognitive_account.openai_services.id
  model {
    format  = "OpenAI"
    name    = "gpt-4"
    version = "turbo-2024-04-09"
  }
  sku {
    name = "Standard"
    capacity = 2
  }
}

# Create an Azure AI Search Service
resource "azurerm_search_service" "ai_search" {
  name                = "my-ai-search-service-demo-madhava-service"  # Must be globally unique
  location            = azurerm_resource_group.openai_rg.location
  resource_group_name = azurerm_resource_group.openai_rg.name
  sku                 = "standard"  # Options: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2
  partition_count     = 1  # Number of partitions (1-12 based on SKU)
  replica_count       = 1  # Number of replicas (1-12 based on SKU)

}

 #Create an Azure Storage Account (Optional: For indexing data)
resource "azurerm_storage_account" "storage" {
  name                     = "aistorageacct123"  # Must be globally unique
  location            = azurerm_resource_group.openai_rg.location
  resource_group_name = azurerm_resource_group.openai_rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a Storage Container for Indexed Data (Optional)
resource "azurerm_storage_container" "search_container" {
  name                  = "search-index-data"
  storage_account_id  = azurerm_storage_account.storage.id
  container_access_type = "private"
}

##################################################################################
# #document intelligence
# # Create a resource group
# resource "azurerm_resource_group" "doc-rg" {
#   name     = "rg-document-intelligence"
#   location = "East US"
# }

# # Create an Azure Cognitive Services account for Document Intelligence
# resource "azurerm_cognitive_account" "document_intelligence" {
#   name                = "docintelligenceacct"  # Must be globally unique
#   location            = azurerm_resource_group.doc-rg.location
#   resource_group_name = azurerm_resource_group.doc-rg.name
#   kind                = "FormRecognizer"  # Specify the service kind for Document Intelligence
#   sku_name            = "F0"  # Standard SKU, can change as required
#   custom_subdomain_name = "docintelligence-madhava"

#   network_acls {
#     default_action = "Allow"
#   }
# }

#######################################################################
# # Create a Resource Group
# resource "azurerm_resource_group" "search_rg" {
#   name     = "rg-ai-search"
#   location = "East US"
# }



#
