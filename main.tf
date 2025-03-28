 terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }

backend "azurerm" {
    resource_group_name   = "Terraform-rg"
    storage_account_name  = "saro97"
    container_name        = "tfstate"
    subscription_id       = 
    tenant_id             = 
    access_key            = 
}
} 

module "virtual_machine"{
   source = "./virtual_machine"
   region = "south India"
   subnet = "vmsubnet"
   vmname = "saravanan"
}