## Network Interface

output "Network_Interface" {
value = "${azurerm_network_interface.networkinterface.id}"
}

## Resource Group

output "Resourrce_Group_Location" {
value = "${azurerm_resource_group.rg.location}"
}

output "Resourrce_Group_Name" {
value = "${azurerm_resource_group.rg.name}"
}
