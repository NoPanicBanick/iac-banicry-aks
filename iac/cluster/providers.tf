terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.34.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}