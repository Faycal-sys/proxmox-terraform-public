resource "proxmox_lxc" "basic_container" {
  target_node  = "your node name"
  hostname     = "your CT name "
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"  # Use correct template
  vmid         = 200  # Unique ID for the container
  unprivileged = true

  // System settings
  cores  = 2
  memory = 1024
  swap   = 512

  // Root filesystem
  rootfs {
    storage = "your data storage"
    size    = "8G"
  }

  // Network
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"  # or "10.0.0.100/24" for static IP
#    gw     = "192.168.0.0"  # Only needed for static IP
  }

  // Features
  features {
    nesting = true
  }

  // SSH access
  ssh_public_keys = <<-EOF
  EOF
}
