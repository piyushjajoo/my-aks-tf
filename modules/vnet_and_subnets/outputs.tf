output "az_rg_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.az_rg.id
}

output "az_vnet_id" {
  description = "The ID of the vnet"
  value       = azurerm_resource_group.az_vnet.id
}

output "az_subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_resource_group.az_subnet.id
}