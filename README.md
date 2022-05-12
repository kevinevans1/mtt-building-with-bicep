# mtt-building-with-bicep
Public repo hosting Microsoft Tech Talks "Building with Bicep" demo files



# Sites:

https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts/blobservices/containers?tabs=bicep


az group create \
    --name storage-resource-group \
    --location eastus

    1.) Az login

2. ) Select subscription

3. create rg
az group create --location westeurope \
   --name Storage_Account_POC

4>)deploy code 
az deployment group create --resource-group Storage_Account_POC --template-file .\main.bicep