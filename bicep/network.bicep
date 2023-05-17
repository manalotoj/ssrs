@description('Location for all resources.')
param location string = resourceGroup().location

@description('Size of the virtual machines')
param vmSize string = 'Standard_D2s_v3'

var appVnetName = 'vNet'
var appVnetWebSubnetName = 'webSubnet'
var appVnetAppGatewaySubnetName = 'gatewaySubnet'
var appVnetDatabaseSubnetName = 'databaseSubnet'


resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: appVnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: appVnetAppGatewaySubnetName
        properties: {
          addressPrefix: '10.0.0.0/27'
        }
      }
      {
        name: appVnetDatabaseSubnetName
        properties: {
          addressPrefix: '10.0.0.32/28'
        }
      }
      {
        name: appVnetWebSubnetName
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
