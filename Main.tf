terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }
}

provider "azurerm" {
 features {}
  subscription_id = "2c68ed43-5abc-4e76-a2f4-b6b3f86d6b04"
}

resource "azurerm_resource_group" "RG-rakesh" {
 for_each =var.rgs
    name     = each.value.name
    location = each.value.location
  
}
resource "azurerm_storage_account" "Storage1" {
  for_each = var.rgs2
    name = each.value.name
    location = each.value.location
    resource_group_name ="rRG-rakesh"
        account_tier= "Standard"
    account_replication_type = "LRS"
}