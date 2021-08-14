terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.2.9:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "qwert123.."
  pm_tls_insecure = true
}


resource "proxmox_vm_qemu" "k8s-master" {
  name        = "k8s-master"
  target_node = "pve"
  clone       = "k8sTemplate"
  full_clone	= false
  bootdisk    = "scsi0"
  cores       = 2
  memory      = 2048
  onboot      = true
  os_type = "cloud-init"
  #config ip and gateway
  ipconfig0 = "ip=192.168.2.201/24,gw=192.168.2.2"
  #set ssh key for ansible
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYr4SaqdYSAd/y+vMTzIb1wwAekCcnpKsHOlR8an6HnWKvPUSb1KhlJkxJBaOr3OPuVNSO5iA+xgxKggYNGTSAvc43vLhgTSUpn4e4I9geWxc0FXCAkLplUQchqLV156MXrZNlHORYkqAjl1QalKFaa6R7OrO5oS6oMY4i+/PM9FK+WHbvENPp4C+QRdRjg/HlWkFYrolLRSnPwQspyPSfNXLoyxVm0452c/MGIcNZQJUVswRm8PH1FqXMa/7jUgRgNKKU+YUCPNNtEwVCXzo0mxCAcRdQqXdjCNIUy0UBcITQNjt2heCnYeyi4EOMVy3+qWcqizQfctjYISzik43X chjtx@DESKTOP-NI7ALMV
EOF
}
