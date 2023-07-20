variable "cluster_name" {
  type        = string
  description = "resource group, vnet, subnet and aks cluster name"
}

variable "k8s_version" {
  type        = string
  description = "kubernetes version"
  default     = "1.26"
}

variable "region" {
  type        = string
  description = "azure region where the aks cluster must be created, this region should match where you have created the resource group, vnet and subnet"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space but for our module implementation we are limiting it to 1 address space only."
  default     = ["10.1.0.0/16"]
}

variable "nodepools" {
  description = "Nodepools for the Kubernetes cluster"
  type = map(object({
    name                  = string
    zones                 = list(number)
    vm_size               = string
    min_count             = number
    max_count             = number
    enable_auto_scaling   = bool
    enable_node_public_ip = bool
    tags                  = map(string)
    node_labels           = map(string)
  }))
  default = {
    worker = {
      name                  = "worker"
      zones                 = [1, 2, 3]
      vm_size               = "Standard_D2_v2"
      min_count             = 1
      max_count             = 100
      enable_auto_scaling   = true
      enable_node_public_ip = true
      tags                  = { worker_name = "worker" }
      node_labels           = { "worker-name" = "worker" }
    }
  }
}
