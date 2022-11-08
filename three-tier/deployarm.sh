#!/bin/bash
set -e
source deployHelper.sh; check_exit_code
Location="northeurope"
printf -- '==================================================\n';
printf -- 'Creating Resource Group for 3 tier Arhitecture\n';
printf -- '================================================\n';

az login --service-principal -u $Env:AZ_SERVICE_PRINCIPAL -p $Env:AZURE_CLIENT_SECRET --tenant $Env:AZURE_TENANT_ID | Out-null
az account set --subscription $Env:AZSUBSCRIPTION

az deployment create --location "$Location" -n createRG-$LOCATION \
  --template-file $workspace/arm/createRG.json  \
  --parameters $workspace/arm/createRG.params.json \
  --parameters rgName="['$BUILDVMRESOURCEGROUP']" --only-show-errors; check_exit_code

printf -- '=====================================\n';
printf -- 'Deploying ARM template for Infra Stage\n';
printf -- '=====================================\n';

# Create a Subnet to the existing Vnet
az deployment create --location "$Location" -n createRG-$LOCATION \
  --template-file $workspace/arm/createSubnetInVnet.json  \
  --parameters $workspace/arm/createSubnetInVnet.params.json \
  --parameters rgName="['$BUILDVMRESOURCEGROUP']" --only-show-errors; check_exit_code

# Create an environment by deploying the below Azure VM and DB VM with Loadbalancer


az deployment create --location "$Location" -n createRG-$LOCATION \
  --template-file $workspace/arm/createEnvironment.json  \
  --parameters $workspace/arm/createEnvironment.params.json \
  --parameters rgName="['$BUILDVMRESOURCEGROUP']" --only-show-errors; check_exit_code

# Add DNS Record Set

az deployment create --location "$Location" -n createRG-$LOCATION \
  --template-file $workspace/arm/createDnsRecordSet.json  \
  --parameters $workspace/arm/createDnsRecordSet.params.json \
  --parameters rgName="['$BUILDVMRESOURCEGROUP']" --only-show-errors; check_exit_code

