###################################

## Managed Disk

resource "azurerm_managed_disk" "manageddisk" {
  name = "Terraform-Managed_Disk"
  location = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = "20"

  tags {
    createdby = "Terraform"
  }
}


## VM

resource "azurerm_virtual_machine" "vm" {
  name                  = "Terraform-VM"
  location              = "${azurerm_resource_group.rg.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.networkinterface.id}"]
  vm_size               = "Standard_B1s"

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_profile_windows_config {
  }

  storage_os_disk {
    name              = "Terraform-OS_Disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
 }

  storage_data_disk {
    name              =  "${azurerm_managed_disk.manageddisk.name}"
    managed_disk_id = "${azurerm_managed_disk.manageddisk.id}"
    create_option     = "Attach"
    lun               = 0
    disk_size_gb      = "${azurerm_managed_disk.manageddisk.disk_size_gb}"
  }

  os_profile {
    computer_name  = "TerraformWin"
    admin_username = "vineet"
    admin_password = "TCS#1234"
}

  tags {
    createdby = "Terraform"
  }
}
