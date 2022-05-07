resource symbolicname 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  name: 'string'
  parent: resourceSymbolicName
  properties: {
    defaultEncryptionScope: 'string'
    denyEncryptionScopeOverride: bool
    enableNfsV3AllSquash: bool
    enableNfsV3RootSquash: bool
    immutableStorageWithVersioning: {
      enabled: bool
    }
    metadata: {}
    publicAccess: 'string'
  }
}
