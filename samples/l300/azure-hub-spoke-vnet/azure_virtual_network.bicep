//Azure Virtual Network

//Parameters
param virtualNetworkName string
param location string
param subnet1Name string
param subnet2Name string


//Virtual Network

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

module vnetPeering 'vnet_peering.bicep'
name: '${name}vnetDeploy'
params: {
  peeringName: storageAccount.name
 
}
}]
