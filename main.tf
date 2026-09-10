resource "azurerm_resource_group" "example" {
  name     = "aks-terraform-rg"
  location = "Spain Central"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "aks-terraform"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "aks-terraform"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v6"
  }
  node_provisioning_profile {
    mode = "Auto"
  }
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
  network_profile {
    network_plugin = "azure"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
