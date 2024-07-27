# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group 
resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name = "cherry-group"  
}
# Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "cherrystorage1134"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# Creat Container Inside Storage Account
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
