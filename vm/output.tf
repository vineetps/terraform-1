

output "ID" {
value = "${azurerm_virtual_machine.vm.id}"
}


output "Name" {
value = "${azurerm_virtual_machine.vm.name}"
}


output "Location" {
value = "${azurerm_virtual_machine.vm.location}"
}


output "Computer_Name" {
value = "${azurerm_virtual_machine.vm.os_profile.1198004634.computer_name}"
}


output "Username" {
value = "${azurerm_virtual_machine.vm.os_profile.1198004634.admin_username}"
}

output "OS_type" {
value = "${azurerm_virtual_machine.vm.storage_os_disk.0.os_type}"
}

output "Public_IP" {
value = "${azure_public_ip.vm.ip_address}"
}
