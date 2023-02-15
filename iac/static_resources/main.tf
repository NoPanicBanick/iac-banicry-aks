locals {
  base_name = "banicry"
  location  = "westus2"

  share_name        = "worlddata"
  storage_acct_name = "${local.base_name}aksvolumes"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.base_name}-rg"
  location = local.location
}

resource "azurerm_storage_account" "stg" {
  name                     = local.storage_acct_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "file_share" {
  name                 = local.share_name
  storage_account_name = azurerm_storage_account.stg.name
  access_tier          = "Hot"
  quota                = 50
}