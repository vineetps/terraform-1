 #!/bin/sh


echo "******Terraform Init*****"
#cd workspace/TerraformInit/
sudo wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_386.zip
sudo unzip terraform_0.11.3_linux_386.zip
sudo ./terraform init

#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform init
#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform apply -input=false -auto-approve
#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform show > output.txt
