###*
# The model to represent a subscription
###
Ext.define 'BlogAppMain.model.Subscription',
  extend: 'Ext.data.Model',
  fields: [
    {name: 'name', type: 'string'},
    {name: 'email', type: 'string'}
  ]
  proxy:
    type: 'rest'
    url: '/subscriptions.json'
    reader:
      type: 'json'
      rootProperty: 'items'
