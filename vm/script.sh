#!/bin/sh


echo -e "\n"
echo "************************************************"
echo '                Terraform Init                 '
echo "************************************************"
echo -e "\n"

../infrastructure/terraform init


echo -e "\n"
echo "************************************************"
echo '                Terraform Apply                 '
echo "************************************************"
echo -e "\n"

../infrastructure/terraform apply \
           -auto-approve \
           -var-file=/tmp/infra-output.tfvars \
           -var client_id=${client_id} \
           -var client_secret=${client_secret} \
           -var subscription_id=${subscription_id} \
           -var tenant_id=${tenant_id} \
           -lock=false

echo -e "\n"
echo "************************************************"
echo '                Creating Output.json          '
echo "************************************************"
echo -e "\n"


../infrastructure/terraform output -json > vm-output.json
