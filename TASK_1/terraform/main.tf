
resource "azurerm_virtual_network" "main" {
  name                = var.network_name
  address_space       = var.network_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "main" {
  count               = length(var.virtual_machine_list)
  name                = lookup(var.virtual_machine_list[count.index], "public_ip_name", "public-ip-${count.index}")
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "main" {
  count               = length(var.virtual_machine_list)
  name                = lookup(var.virtual_machine_list[count.index], "nic_name", "nic-${count.index}")
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = lookup(var.virtual_machine_list[count.index], "name", "nic-${count.index}")
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main[count.index].id
  }
}

resource "azurerm_virtual_machine" "main" {
  count                 = length(var.virtual_machine_list)
  name                  = lookup(var.virtual_machine_list[count.index], "vm_name", "vm-${count.index}")
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size               = lookup(var.virtual_machine_list[count.index], "vm_size", "Standard_DS1_v2")

  delete_os_disk_on_termination     = lookup(var.virtual_machine_list[count.index], "delete_os_disk_on_termination", true)
  delete_data_disks_on_termination  = lookup(var.virtual_machine_list[count.index], "delete_data_disks_on_termination", true)

  storage_image_reference {
    publisher = lookup(var.virtual_machine_list[count.index], "publisher", "Canonical")
    offer     = lookup(var.virtual_machine_list[count.index], "offer", "UbuntuServer")
    sku       = lookup(var.virtual_machine_list[count.index], "sku", "16.04-LTS")
    version   = lookup(var.virtual_machine_list[count.index], "version", "latest")
  }
  storage_os_disk {
    name              = lookup(var.virtual_machine_list[count.index], "disk_name", "disk-${count.index}")
    caching           = lookup(var.virtual_machine_list[count.index], "caching", "ReadWrite")
    create_option     = lookup(var.virtual_machine_list[count.index], "create_option", "FromImage")
    managed_disk_type = lookup(var.virtual_machine_list[count.index], "managed_disk_type", "Standard_LRS")
  }
  os_profile {
    computer_name  = lookup(var.virtual_machine_list[count.index], "computer_name", "host-${count.index}")
    admin_username = lookup(var.virtual_machine_list[count.index], "admin_username", var.default_admin_username)
    admin_password = lookup(var.virtual_machine_list[count.index], "admin_password", var.default_admin_password)
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = lookup(var.virtual_machine_list[count.index], "tags", {})
}