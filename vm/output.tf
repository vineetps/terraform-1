

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
value = "${azurerm_virtual_machine.vm.os_profile.*.computer_name}"
}


output "Username" {
value = "${azurerm_virtual_machine.vm.os_profile.*.admin_username}"
}

output "OS_type" {
value = "${azurerm_virtual_machine.vm.storage_os_disk.0.os_type}"
}

#output "Public_IP" {
#value = "${data.azure_public_ip.eip.ip_address}"
#}
