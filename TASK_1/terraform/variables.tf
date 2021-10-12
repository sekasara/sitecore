variable "network_name" {
  default = "net-1"
}

variable "network_address_space" {
  default = ["10.11.0.0/16"]
}

variable "location" {
  default = "Central US"
}

variable "resource_group_name" {
  default = "1-4719b948-playground-sandbox"
}

variable "subnet_name" {
  default = "subnet-1"
}

variable "subnet_address_prefixes" {
  default = ["10.11.1.0/24"]
}

variable "virtual_machine_list" {
  default = [
    {
      "nic_name" : "nic-web-1",
      "public_ip_name": "public-ip-1",
      "vm_name" : "vm-web-1",
      "vm_size" : "Standard_DS1_v2",
      "delete_os_disk_on_termination": true,
      "delete_data_disks_on_termination": true,
      "publisher" : "Canonical",
      "offer" : "UbuntuServer",
      "sku" : "16.04-LTS",
      "version" : "latest",
      "disk_name" : "disk-1",
      "caching" : "ReadWrite",
      "create_option" : "FromImage",
      "managed_disk_type" : "Standard_LRS",
      "computer_name" : "host-1",
      "admin_username" : "testadmin",
      "admin_password" : "Admin123",
      "tags" : {},
    },
    {
      "nic_name" : "nic-web-2",
      "public_ip_name": "public-ip-2",
      "vm_name" : "vm-web-2",
      "vm_size" : "Standard_DS1_v2",
      "delete_os_disk_on_termination": true,
      "delete_data_disks_on_termination": true,
      "publisher" : "Canonical",
      "offer" : "UbuntuServer",
      "sku" : "16.04-LTS",
      "version" : "latest",
      "disk_name" : "disk-2",
      "caching" : "ReadWrite",
      "create_option" : "FromImage",
      "managed_disk_type" : "Standard_LRS",
      "computer_name" : "host-2",
      "admin_username" : "testadmin",
      "admin_password" : "Admin123",
      "tags" : {},
    }
  ]
}

variable "default_admin_username" {
  default = ""
}

variable "default_admin_password" {
  default = ""
}
