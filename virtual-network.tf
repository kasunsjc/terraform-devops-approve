resource "azurerm_resource_group" "network_rg" {
  location = "southeast asia"
  name = "rg-network"
}

resource "random_string" "domain_name" {
  length = 5
  upper = false
  special = false
  number = false
}

resource "azurerm_virtual_network" "virtual_networks" {
  name                = "myvnet-1"
  address_space       = ["10.60.0.0/16"]
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}

# Create Subnet
resource "azurerm_subnet" "server_subnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_networks.name
  address_prefixes     = ["10.60.2.0/24"]
}

# Create Azure Public IP Address
resource "azurerm_public_ip" "public_ip" {
  count = 2
  name                = "mypublicip-${count.index}"
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = azurerm_resource_group.network_rg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${count.index}-${random_string.domain_name.id}"
}
