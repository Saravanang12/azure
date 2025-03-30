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
  client_id       = var.client_id != "" ? var.client_id : var.client_id
  client_secret   = var.client_secret != "" ? var.client_secret : var.client_secret
  subscription_id = var.subscription_id != "" ? var.subscription_id : var.subscription_id
  tenant_id       = var.tenant_id != "" ? var.tenant_id : var.tenant_id
}

module "virtual_machine" {
  source = "./virtual_machine"
  region = "South India"
  subnet = "vmsubnet"
  vmname = "saravanan"
}
