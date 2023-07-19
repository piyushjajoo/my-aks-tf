# setup azure terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.65.0"
    }
  }
}

# azurerm_resource_group to create azure resource group
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/resource_group
resource "azurerm_resource_group" "az_rg" {
  name     = var.resource_group_name
  location = var.region
  tags     = merge(var.tags, var.additional_resource_group_tags)
}

# azurerm_virtual_network to create the azure vnet in the azure resource group
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/virtual_network
resource "azurerm_virtual_network" "az_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
  address_space       = var.address_space
  tags                = merge(var.tags, var.additional_vnet_tags)
}

# azurerm_subnet to create the azure subnet in the azure vnet
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/subnet
resource "azurerm_subnet" "az_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.az_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = var.subnet_address_prefix
  service_endpoints    = var.service_endpoints
  tags                 = merge(var.tags, var.additional_subnet_tags)
}