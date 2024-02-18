# Terraform Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}
# Provider Block

provider "azurerm" {
  features {}
  tenant_id       = "6b406b5f-c04e-4cc0-aef8-8603007c61a7"
  subscription_id = "ccd6d134-0920-442c-a405-1a96d95ea04d"
}



