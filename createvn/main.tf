# create a resource group

resource "azurerm_resource_group" "mod-rg" {
  name     = var.rgname
  location = var.region
}

# Create a virtual network 
resource "azurerm_virtual_network" "mod-vnet" {
  name                = var.vnname
  resource_group_name = azurerm_resource_group.mod-rg.name
  location            = azurerm_resource_group.mod-rg.location
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags ={
    environment = "Dev"
  }
}


# creating a subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.mod-rg.name
  virtual_network_name = azurerm_virtual_network.mod-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}



