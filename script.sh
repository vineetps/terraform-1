 #!/bin/sh
uname -a
#apt-get --yes install sudo
echo "******Terraform Init******"
pwd
echo "~~~~~~~~~~~~~~~~~~~~~Logged User~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
id
#cd workspace/TerraformInit/
wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_386.zip -P /tmp
unzip /tmp/terraform_0.11.3_linux_386.zip -d /tmp
cp /tmp/terraform /usr/bin
terraform init
terraform apply 

#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform init
#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform apply -input=false -auto-approve
#sudo /tmp/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/Terraform/terraform show > output.txt
