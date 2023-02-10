locals {
  location  = "westus2"
  base_name = "banicry"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.base_name}-rg"
  location = local.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.base_name}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "bani"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

# TODO - Move to another repo to avoid deleting images
resource "azurerm_container_registry" "acr" {
  name                = "${local.base_name}-acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}
