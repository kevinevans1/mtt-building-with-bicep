//Azure Hub & Spoke POC


//Parameters
param location string
//Hub
param virtualHubNetworkName string
param vnetHubAddressSpace string //'10.0.0.0/16'
param subnet1HubName string
param subnet1HubAddressPrefix string //'10.0.0.0/24'
param subnet2HubName string
param subnet2HubAddressPrefix string //'10.0.1.0/24'

//Spoke
param virtualSpokeNetworkName string
param vnetSpokeAddressSpace string //'10.0.7.0/16'
param subnet1SpokeName string
param subnet1SpokeAddressPrefix string //'10.0.7.0/24'
param subnet2SpokeName string
param subnet2SpokeAddressPrefix string //'10.0.8.0/24'

//Peering
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



//Virtual Network Hub
module virtualNetwork_hub 'azure_virtual_network.bicep' = {
  name: virtualHubNetworkName
  params:{
    virtualNetworkName: virtualHubNetworkName
    location: location
    vnetAddressSpace: vnetHubAddressSpace
    subnet1Name: subnet1HubName
    subnet1AddressPrefix: subnet1HubAddressPrefix
    subnet2Name: subnet2HubName
    subnet2AddressPrefix: subnet2HubAddressPrefix
  }
}

//Virtual Network Spoke
module virtualNetwork_spoke 'azure_virtual_network.bicep' = {
  name: virtualSpokeNetworkName
  params:{
    virtualNetworkName: virtualSpokeNetworkName
    location: location
    vnetAddressSpace: vnetSpokeAddressSpace
    subnet1Name: subnet1SpokeName
    subnet1AddressPrefix: subnet1SpokeAddressPrefix
    subnet2Name: subnet2SpokeName
    subnet2AddressPrefix: subnet2SpokeAddressPrefix
  }
}

//Vnet Peering
module hubtospoke 'vnet_peering.bicep' = {
  name: virtualNetworkPeeringName
  params: {
    virtualNetworkName: virtualHubNetworkName
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    doNotVerifyRemoteGateway: doNotVerifyRemoteGateway
    useRemoteGateways: useRemoteGateways
    peeringState: peeringState
    peeringSyncLevel: peeringSyncLevel
    addressPrefixes: addressPrefixes
    virtualNetworkCommunity: virtualNetworkCommunity
    remoteVirtualNetwork: remoteVirtualNetwork
    remoteVirtualNetworkAddressSpace: remoteVirtualNetworkAddressSpace

  }
}
