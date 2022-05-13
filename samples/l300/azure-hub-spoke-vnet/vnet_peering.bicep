//Azure Virtual Network

//Parameters
param allowForwardedTraffic bool = true
param allowGatewayTransit bool = false
param allowVirtualNetworkAccess bool = true
param useRemoteGateways bool = false
param sourceVnetId string 
param remoteVnetId string 

var sourceVnetName = split(sourceVnetId, '/')[8]
var remoteVnetName = split(remoteVnetId, '/')[8]


//Virtual Network Peering
resource peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-08-01' = {
  name: '${sourceVnetName}/peer-to-${remoteVnetName}'
  properties: {
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    useRemoteGateways: useRemoteGateways
    remoteVirtualNetwork: {
      id: remoteVnetId
    }
  }
}

