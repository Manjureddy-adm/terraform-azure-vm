output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "public_ip" {
  description = "Public IP address (if created)"
  value       = var.create_public_ip ? azurerm_public_ip.pubip[0].ip_address : ""
}

output "private_ip" {
  description = "Private IP address of the NIC"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
