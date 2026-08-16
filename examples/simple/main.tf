variable "location" {
  type    = string
  default = "eastus"
}

variable "rg_name" {
  type    = string
  default = "example-nginx-rg"
}

variable "vnet_name" {
  type    = string
  default = "example-vnet"
}

variable "subnet_name" {
  type    = string
  default = "internal"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "nginx_vm" {
  source              = "../../modules/nginx_vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_name             = "manju-nginx-vm"
  vm_size             = "Standard_B1s"
  admin_username      = "azureuser"
  ssh_public_key      = file("~/.ssh/id_rsa.pub")
  subnet_id           = azurerm_subnet.subnet.id
  create_public_ip    = true
}
