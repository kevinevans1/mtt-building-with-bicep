//Azure Virtual Network

//Parameters
param virtualNetworkName string
param location string
param subnet1Name string
param subnet2Name string


//Virtual Network Peering
resource vnet_peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-08-01' = {
  name: 'string'
  parent: resourceSymbolicName
  properties: {
    allowForwardedTraffic: bool
    allowGatewayTransit: bool
    allowVirtualNetworkAccess: bool
    doNotVerifyRemoteGateways: bool
    peeringState: 'string'
    peeringSyncLevel: 'string'
    remoteAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    remoteBgpCommunities: {
      virtualNetworkCommunity: 'string'
    }
    remoteVirtualNetwork: {
      id: 'string'
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        'string'
      ]
    }
    useRemoteGateways: bool
  }
}
