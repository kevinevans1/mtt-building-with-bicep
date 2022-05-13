//Azure Storage Account Container

//Parameters

param storageName string
param containerName string

//Container

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-09-01' = {
  name: '${storageName}/default/${containerName}'
}
