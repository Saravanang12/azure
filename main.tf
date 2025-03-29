 terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }

terraform {
  backend "azurerm" {}
}
}

module "virtual_machine"{
   source = "./virtual_machine"
   region = "south India"
   subnet = "vmsubnet"
   vmname = "saravanan"
}
