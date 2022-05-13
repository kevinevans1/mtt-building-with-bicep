//Azure Virtual Network

//Parameters
param virtualNetworkName string
param location string
param vnetAddressSpace string
param subnet1Name string
param subnet1AddressPrefix string
param subnet2Name string
param subnet2AddressPrefix string



//Virtual Network
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressSpace
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1AddressPrefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2AddressPrefix
        }
      }
    ]
  }
}




