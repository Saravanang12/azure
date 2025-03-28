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
resource "azurerm_network_interface" "nic" {
  name                = "mod-nic"
  location            = var.region
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id 
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "var.vmname"
  location              = var.region
  resource_group_name   = var.rgname
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B2ms"

storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}