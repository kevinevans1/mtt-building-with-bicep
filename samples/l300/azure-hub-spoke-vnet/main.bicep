//Azure Hub & Spoke POC

//Parameters
param location string
//Hub
param virtualHubNetworkName string = 'vnet-1'
param vnetHubAddressSpace string = '10.0.0.0/16'
param subnet1HubName string = 'subnet-1'
param subnet1HubAddressPrefix string = '10.0.0.0/24'
param subnet2HubName string = 'subnet-2'
param subnet2HubAddressPrefix string = '10.0.1.0/24'

//Spoke
param virtualSpokeNetworkName string = 'vnet-2'
param vnetSpokeAddressSpace string = '10.7.0.0/16'
param subnet1SpokeName string = 'subnet-1'
param subnet1SpokeAddressPrefix string = '10.7.0.0/24'
param subnet2SpokeName string = 'subnet-2'
param subnet2SpokeAddressPrefix string ='10.7.1.0/24'

//Virtual Network Hub
module virtualNetwork_hub 'azure_virtual_network.bicep' = {
  name: virtualHubNetworkName
  params: {
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
  params: {
    virtualNetworkName: virtualSpokeNetworkName
    location: location
    vnetAddressSpace: vnetSpokeAddressSpace
    subnet1Name: subnet1SpokeName
    subnet1AddressPrefix: subnet1SpokeAddressPrefix
    subnet2Name: subnet2SpokeName
    subnet2AddressPrefix: subnet2SpokeAddressPrefix
  }
}

//Vnet Peering - Hub to Spoke
module hubToSpoke 'vnet_peering.bicep' = {
  name: 'peer-hub-to-spoke'
  params: {
    sourceVnetId: virtualNetwork_hub.outputs.outVnetId
    remoteVnetId: virtualNetwork_spoke.outputs.outVnetId
  }
}

//Vnet Peering - Spoke to Hub
module spokeToHub 'vnet_peering.bicep' = {
  name: 'peer-spoke-to-hub'
  params: {
    sourceVnetId: virtualNetwork_spoke.outputs.outVnetId
    remoteVnetId: virtualNetwork_hub.outputs.outVnetId
  }
}
