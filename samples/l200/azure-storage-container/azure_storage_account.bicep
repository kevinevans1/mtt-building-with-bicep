//Azure Storage Account

//Parameters

param stgActName string
param primaryLocation string
param storageSKU string
param containerNames array


//Storage Account

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' ={
  name: stgActName
  location: primaryLocation
  kind: 'StorageV2'
  sku:{
    name: storageSKU
  }

  properties:{
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot' 
    allowBlobPublicAccess:false
    allowSharedKeyAccess: false
  }
}

//Storage Account Container 

module storageContainer 'container.bicep' = [for name in containerNames:{
  name: '${name}containerDeploy'
  params: {
    storageName: storageAccount.name
    containerName:name
  }
}]



