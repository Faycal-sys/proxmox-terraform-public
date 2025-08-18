resource "proxmox_vm_qemu" "test_vm" {
  name        = "terraform-test-vm"
  target_node = "codpartner"
  vmid        = 110
  clone       = "101"  # Replace with existing VM template name
  full_clone  = true

  cores  = 2
  memory = 2048
  agent  = 1

  disk {
    type    = "scsi"
    storage = "DATA"  # Using 'local' storage
    size    = "20G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}
