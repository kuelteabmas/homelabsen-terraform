# Create a new VM from a template

resource "proxmox_vm_qemu" "dakar_vm_k3s_m1" {
    
    # VM General Settings
    target_node = var.target_node
    vmid = var.vmid_m1
    name = var.name_m1
    desc = var.desc_m1

    bios = var.bios
    scsihw = var.scsihw

    # VM Advanced General Settings
    onboot = var.onboot 

    # Display (for Console view in WebUI)
    vga {
        type = var.vga_type # std for Default
    }

    # VM System Settings
    agent = var.agent # (unique to proxmox) for the qemu guest agent of the VM being created # as of 3.0.1-rc6, it need to be set to 0 if your cloud-init image doesn't have qemu-guest-agent installed

    # VM OS Settings
    clone = var.clone

    # VM CPU Settings
    cores = var.cores
    sockets = var.sockets
    cpu_type = var.cpu_type
    
    # VM Memory Settings
    memory = var.memory

    # VM Network Settings
    network {
        id = var.network_id
        bridge = var.network_bridge
        model = var.network_model
        macaddr = var.macaddr_m1
    }

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = var.disk_storage
                    size = var.disk_size
                }
            }
        }
         ide {
            ide2 {
                cloudinit {
                    storage = var.disk_storage
                }
            }   
        }
    }

    # VM Cloud-Init Settings
    os_type = var.os_type

    # IP Address and Gateway
    ipconfig0 = var.ipconfig0_m1
    nameserver = var.nameserver

    # Default User
    ciuser = var.ciuser

    sshkeys = file(var.sshkeys)
}