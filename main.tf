resource "azurerm_virtual_network" "vnet" {
  name                = "VineetVNet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}
 

resource "azurerm_subnet" "PublicSubnetA" {
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    name           = "PublicSubnetA"
    address_prefix = "10.0.1.0/24"
  }


resource "azurerm_subnet" "PrivateSubnetA" {
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    name           = "PrivateSubnetA"
    address_prefix = "10.0.2.0/24"
  }


resource "azurerm_subnet" "PublicSubnetB" {
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    name           = "PublicSubnetB"
    address_prefix = "10.0.3.0/24"
  }


resource "azurerm_subnet" "PrivateSubnetB" {
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    name           = "PrivateSubnetB"
    address_prefix = "10.0.4.0/24"
  }




resource "azurerm_network_security_group" "securitygroup" {
    name                = "Vineet-SG"
    location            = "westus"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    tags {
       createdby  = "Terraform"
    }    
}
resource "azurerm_network_security_rule" "ingress" {
        name                       = "Any"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
	resource_group_name         = "${azurerm_resource_group.rg.name}"
  	network_security_group_name = "${azurerm_network_security_group.securitygroup.name}"
    }

resource "azurerm_public_ip" "eip" {
  name                         = "Vineet-PublicIP"
  location                     = "${azurerm_resource_group.rg.location}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    environment = "test"
  }
}

resource "azurerm_network_interface" "networkinterface" {
  name                = "Vineet-NetworkInterface"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags {
        createdby = "Terraform"
    }

  ip_configuration {
    name                          = "Vineet"
    subnet_id                     = "${azurerm_subnet.PublicSubnetA.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "dynamic"
  }
}


resource "azurerm_lb" "loadbalancer" {
  name                = "Vineet-LoadBalancer"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = "${azurerm_network_interface.networkinterface.ip_configuration.public_ip_address_id}"
  }
}
