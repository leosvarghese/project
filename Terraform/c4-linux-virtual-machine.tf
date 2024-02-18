# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = "mylinuxvm-1"
  computer_name         = "devlinux-vm1" # Hostname of the VM
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmnic.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  provisioner "local-exec" {
    command = "chmod 600 linuxmachinekey.pem"
  }

  provisioner "local-exec" {
    command     = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key ${path.module}/ssh-keys/terraform-azure.pem -i playbook.yml"
    working_dir = "${path.module}/ansible"
  }
}
