# setup azure terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.65.0"
    }
  }
}

# azurerm_kubernetes_cluster to create k8s cluster
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version
  node_resource_group = "aks_${var.cluster_name}_${var.region}"
  tags                = var.aks_tags

  default_node_pool {
    name                         = "system"
    type                         = "VirtualMachineScaleSets"
    node_count                   = 1
    vm_size                      = "Standard_DS2_v2"
    zones                        = [1, 2, 3]
    vnet_subnet_id               = var.az_subnet_id
    only_critical_addons_enabled = true

    node_labels = {
      "worker-name" = "system"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  # enable workload identity
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
}

# azurerm_kubernetes_cluster_node_pool to create k8s workers
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/kubernetes_cluster_node_pool
resource "azurerm_kubernetes_cluster_node_pool" "k8s-worker" {
  for_each = var.nodepools

  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = each.value.vm_size
  min_count             = each.value.min_count
  max_count             = each.value.max_count
  enable_auto_scaling   = each.value.enable_auto_scaling
  enable_node_public_ip = each.value.enable_node_public_ip
  zones                 = each.value.zones
  vnet_subnet_id        = var.az_subnet_id
  tags                  = each.value.tags

  node_labels = each.value.node_labels
}
