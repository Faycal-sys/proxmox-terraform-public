resource "proxmox_lxc" "basic_container" {
  target_node  = "codpartner"
  hostname     = "terraform-lxc"
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"  # Use correct templa
  vmid         = 200  # Unique ID for the container
  unprivileged = true

  // System settings
  cores  = 2
  memory = 1024
  swap   = 512

  // Root filesystem
  rootfs {
    storage = "DATA"
    size    = "8G"
  }

  // Network
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"  # or "10.0.0.100/24" for static IP
#    gw     = "192.168.1.1"  # Only needed for static IP
  }

  // Features
  features {
    nesting = true
  }

  // SSH access
  ssh_public_keys = <<-EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICZRWPkR/Jl01SZU4CGCrunZ5ZvaStITcn2HHJTJ/u/u proxmox-production@cod.partners.com
  EOF
}
