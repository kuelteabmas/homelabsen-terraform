# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox
terraform {
  
  # required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
        source = "Telmate/proxmox"
        version = "3.0.1-rc1"
    }
  }
}

# variable "proxmox_api_url" {
#     type = string
# }

# variable "proxmox_api_token_id" {
#     type = string
#     sensitive = true
# }

# variable "proxmox_api_token_secret" {
#     type = string
#     sensitive = true
# }


# variable "proxmox_user" {
#     type = string
#     sensitive = true
# }

# variable "proxmox_password" {
#     type = string
#     sensitive = true
# }

# provider "proxmox" {
#   pm_api_url = var.proxmox_api_url
#   pm_api_token_id = var.proxmox_api_token_id
#   pm_api_token_secret = var.proxmox_api_token_secret
  
#   pm_user = var.proxmox_user
#   pm_password  = var.proxmox_password
#   pm_tls_insecure = true
# }
provider "proxmox" {
  pm_api_url = "https://192.168.12.108:8006/api2/json"
  pm_user = "root@pam"
  pm_password  = "Steelo124578;!"
  pm_tls_insecure = true
}