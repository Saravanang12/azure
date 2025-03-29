

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
}

module "virtual_machine" {
  source = "./virtual_machine"
  region = "South India"
  subnet = "vmsubnet"
  vmname = "saravanan"
}
