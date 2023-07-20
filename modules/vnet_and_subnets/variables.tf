variable "resource_group_name" {
  type        = string
  description = "The Name for this Resource Group. Changing this forces a new Resource Group to be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet. Changing this forces a new resource to be created."
}

variable "region" {
  type        = string
  description = "The location/region where the resource group. Changing this forces a new resource to be created. We will create the vnet and subnets in the same location/region where the resource group is."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space but for our module implementation we are limiting it to 1 address space only."
  default     = ["10.1.0.0/16"]
  validation {
    condition     = length(var.address_space) == 1
    error_message = "Only a single address space can be set. Please check your subnet address prefixes."
  }
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "The address prefixes to use for the subnet. Currently only a single address prefix can be set as the Multiple Subnet Address Prefixes Feature is not yet in public preview or general availability."
  default     = ["10.1.0.0/16"]
  validation {
    condition     = length(var.subnet_address_prefix) == 1
    error_message = "Only a single address prefix can be set. Please check your subnet address prefixes."
  }
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Storage.Global and Microsoft.Web."
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "common tags to be assigned to all the resources"
  default     = {}
}

variable "additional_vnet_tags" {
  type        = map(any)
  description = "additional tags for vnet"
  default     = {}
}

variable "additional_resource_group_tags" {
  type        = map(any)
  description = "additional tags for resource group"
  default     = {}
}