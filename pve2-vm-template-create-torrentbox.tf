# Create a new VM from a template

resource "proxmox_vm_qemu" "pve2-vm-template-create-torrentbox" {
    
    # VM General Settings
    target_node = "pve2"
    vmid = "350"
    name = "torrentbox"
    desc = "Torrent Box"

    bios = "seabios"
    scsihw = "virtio-scsi-pci"

    # VM Advanced General Settings
    onboot = false 

    # Display (for Console view in WebUI)
    vga {
        type = "std" # std for Default
    }

    # VM System Settings
    agent = 1 # (unique to proxmox) for the qemu guest agent of the VM being created

    # VM OS Settings
    clone = "ubuntu-cloud-2204"

     # VM CPU Settings
    cores = 4
    sockets = 1
    cpu = "host"
    
    # VM Memory Settings
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "60G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # IP Address and Gateway
    ipconfig0 = "ip=192.168.12.123/24,gw=192.168.12.1"
    nameserver = "1.1.1.1"

    # Default User
    ciuser = "sambaetleuk"

    # SSH key Ubuntu dev10 homelabsen 
    # sshkeys = <<EOF
    # ssh-rsa AABB3NzaC1kj...key1
    # EOF

    sshkeys = file("~/.ssh/pve2_torrentbox.pub")
}