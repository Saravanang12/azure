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

  use_oidc = true  # 🔥 This tells Terraform to use OIDC instead of manual credentials
}

module "virtual_machine" {
  source = "./virtual_machine"
}
