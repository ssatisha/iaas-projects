# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }

}

#Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  
  
  client_id 		= "fb1c1ccc-7f8c-46cd-a75b-1e099930da26"
  client_secret	    = "p2n8Q~pzZ~P5MJB.nkTTNd5LKgh2tLhYmsS3NcyK"
  subscription_id   = "248b03ea-e216-4907-be71-a97731048c0d"
  tenant_id   		= "26529824-a8e3-4f55-a457-18904558572e"
}


