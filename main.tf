terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc = true  # 🔥 This tells Terraform to use OIDC instead of manual credentials
}

module "virtual_machine" {
  source = "./virtual_machine"
}
