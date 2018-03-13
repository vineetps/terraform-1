#!/bin/sh


echo "************************************************"
echo '                Terraform Download              '
echo "************************************************"

wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_386.zip

unzip -o /tmp/terraform_0.11.3_linux_386.zip

echo "************************************************"
echo '                Terraform Init                 '
echo "************************************************"
echo -e "\n"

./terraform init


echo "************************************************"
echo '                Terraform Apply                 '
echo "************************************************"
echo -e "\n"

./terraform apply -auto-approve -var client_id=${client_id} -var client_secret=${client_secret} -var subscription_id=${subscription_id} -var tenant_id=${tenant_id}

./terraform show > output.txt
