variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  sensitive   = true
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Whether to ignore TLS errors"
  type        = bool
  default     = true
}

variable "target_node" {
  description = "Proxmox node to create resources on"
  type        = string
  default     = "codpartner"
}
