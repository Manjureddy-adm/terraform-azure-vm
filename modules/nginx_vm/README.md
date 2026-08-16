# Module: nginx_vm

Terraform module to provision an Azure Linux VM with Nginx installed via cloud-init.

This module creates:
- Network Security Group (allows SSH and HTTP)
- Public IP (optional)
- Network Interface
- Linux Virtual Machine (Ubuntu) with cloud-init script to install Nginx

Refer to the examples/simple/ README for usage.
