//Azure Virtual Network

//Parameters
param virtualNetworkPeeringName string
param allowForwardedTraffic string
param allowGatewayTransit string
param allowVirtualNetworkAccess string
param doNotVerifyRemoteGateway string
param useRemoteGateways string
param peeringState string
param peeringSyncLevel string
param addressPrefixes string
param virtualNetworkCommunity string
param remoteVirtualNetwork string
param remoteVirtualNetworkAddressSpace string


//Virtual Network Peering
resource vnet_peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-08-01' = {
  name: virtualNetworkPeeringName
  parent: //<<<<<<<<Whats this ?
  properties: {
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    doNotVerifyRemoteGateways: doNotVerifyRemoteGateway
    peeringState: peeringState
    peeringSyncLevel: peeringSyncLevel
    remoteAddressSpace: {
      addressPrefixes: [
        addressPrefixes
      ]
    }
    remoteBgpCommunities: {
      virtualNetworkCommunity: virtualNetworkCommunity
    }
    remoteVirtualNetwork: {
      id: remoteVirtualNetwork
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        remoteVirtualNetworkAddressSpace
      ]
    }
    useRemoteGateways: useRemoteGateways
  }
}
