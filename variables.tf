variable "region" {
  type        = string
  description = "aks region where the resources are being created"
}

variable "cluster_name" {
  type        = string
  description = "aks cluster name, same name is used for resource group, vnet and subnets"
  default     = "platformwale"
}

variable "k8s_version" {
  type        = string
  description = "k8s version"
  default     = "1.26"
}