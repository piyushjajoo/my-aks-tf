# vnet and subnet module

This is the documentation for vnet and subnet module.

## Summary

This module creates following resources -
- a resource group
- a vnet
- a subnet

Please read the documentation below to know details about the variables accepted by this module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.az_rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.az_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.az_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_resource_group_tags"></a> [additional\_resource\_group\_tags](#input\_additional\_resource\_group\_tags) | additional tags for resource group | `map(any)` | `{}` | no |
| <a name="input_additional_vnet_tags"></a> [additional\_vnet\_tags](#input\_additional\_vnet\_tags) | additional tags for vnet | `map(any)` | `{}` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. You can supply more than one address space but for our module implementation we are limiting it to 1 address space only. | `list(string)` | <pre>[<br>  "10.1.0.0/16"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The location/region where the resource group. Changing this forces a new resource to be created. We will create the vnet and subnets in the same location/region where the resource group is. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Name for this Resource Group. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Storage.Global and Microsoft.Web. | `list(string)` | `[]` | no |
| <a name="input_subnet_address_prefix"></a> [subnet\_address\_prefix](#input\_subnet\_address\_prefix) | The address prefixes to use for the subnet. Currently only a single address prefix can be set as the Multiple Subnet Address Prefixes Feature is not yet in public preview or general availability. | `list(string)` | <pre>[<br>  "10.1.0.0/16"<br>]</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | common tags to be assigned to all the resources | `map(any)` | `{}` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_rg_id"></a> [az\_rg\_id](#output\_az\_rg\_id) | The ID of the resource group |
| <a name="output_az_rg_name"></a> [az\_rg\_name](#output\_az\_rg\_name) | The ID of the resource group |
| <a name="output_az_subnet_id"></a> [az\_subnet\_id](#output\_az\_subnet\_id) | The ID of the subnet |
| <a name="output_az_vnet_id"></a> [az\_vnet\_id](#output\_az\_vnet\_id) | The ID of the vnet |
