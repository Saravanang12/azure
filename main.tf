terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Terraform-rg"
    storage_account_name = "saro97"
    container_name       = "tfstate"
    key                 = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  
}

module "virtual_machine" {
  source = "./virtual_machine"
  region = "South India"
  subnet = "vmsubnet"
  vmname = "saravanan"
}
