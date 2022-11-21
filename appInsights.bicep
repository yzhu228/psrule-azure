param appInsightsName string = 'appi-iac-test'
param appInsightsKeySecretName string = 'APPINSIGHTS-INSTRUMENTATIONKEY'
param keyVaultName string = 'kv-iac-test'

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: keyVaultName
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' existing = {
  name: appInsightsName
}

resource kvsAppInsightsInstrumentationKey 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: appInsightsKeySecretName
  parent: keyVault
  properties: {
    value: appInsights.properties.InstrumentationKey
  }
}
