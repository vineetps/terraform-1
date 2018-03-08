#!/bin/sh

sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform init
sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform -y apply
