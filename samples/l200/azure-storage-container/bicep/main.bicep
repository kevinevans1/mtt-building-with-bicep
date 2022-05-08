//Bicep Scope Target & Parameters

targetScope= 'subscription'

param resourceGroupName string = 'bicep-rg-02'
param resourceGroupLocation string = 'eastus'
param storageAccountName string = 'azbicepsta98765'
param location string = 'eastus'




//Azure Resource_Group Deployment//
resource azrg01 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: resourceGroupName
  location: resourceGroupLocation
  
}

//Azure Storage Account Module Deployment//
module storageAcct 'azure_storage_account.bicep'= {
  name: 'storageModule'
  scope: azrg01
  params: {
    location: location
    storageAccountName: storageAccountName
    
  }
}






