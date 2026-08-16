# Simple example

This example shows how to use the modules/nginx_vm module to provision an Ubuntu VM with Nginx installed.

Usage:

1. Initialize Terraform:

   terraform init

2. Review the plan:

   terraform plan -var-file="terraform.tfvars"

3. Apply:

   terraform apply -var-file="terraform.tfvars"

Note: Ensure you have authenticated to Azure (e.g., `az login`) and set any required environment variables for the AzureRM provider.
