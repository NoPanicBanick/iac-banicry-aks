locals {
  location  = "westus2"
  base_name = "banicry-aks"
}

resource "azurerm_resource_group" "rg" {
  name     = local.base_name
  location = local.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.base_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "bani"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D1_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
