//Azure Storage Account Manifest

//Parameters
@minLength(3)
@maxLength(19)
@description('storage account instance')
param primaryLocation string = 'westeurope'
param namePrefix string = 'storage'



//Allowed Storage Account Vaules
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'westeurope'
])
param storageSKU string = 'Standard_LRS'
param containerNames array = [
  '60x60'
  '120x120'
  'full'
]

//Variables
var storageActName = '${namePrefix}${uniqueString(resourceGroup().id)}'



//Azure Storage Account Module
module storageAccount 'azure_storage_account.bicep' = {
  name: 'storageAccountDeploy' 
  params:{
    stgActName: storageActName
    primaryLocation: primaryLocation
    storageSKU: storageSKU
    containerNames: containerNames
  }
} 






