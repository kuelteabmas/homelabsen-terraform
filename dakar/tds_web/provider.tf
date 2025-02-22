# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox
terraform {
  required_providers {
    proxmox = {
        source = "Telmate/proxmox"
        version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.virtual_environment_endpoint
  pm_user = var.virtual_environment_username
  pm_password = var.virtual_environment_password
  pm_tls_insecure = var.provider_insecure
}
