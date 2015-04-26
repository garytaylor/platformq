Ext.define 'BlogAppMain.view.subscription.SubscriptionCreate',
  extend: 'Ext.form.Panel'
  alias: 'widget.subscriptioncreate'
  requires: [
    'BlogAppMain.view.subscription.SubscriptionCreateModel'
    'BlogAppMain.view.subscription.SubscriptionCreateController'
  ]
  viewModel: 'subscriptioncreate'
  controller: 'subscriptioncreate'
  items: [
    {xtype: 'textfield', fieldLabel: 'Name', bind: '{subscription.name}'}
    {xtype: 'textfield', fieldLabel: 'Email', bind: '{subscription.email}'}
  ]
  bbar: [
    {xtype: 'tbfill'}
    {xtype: 'button', text: 'Subscribe', itemId: 'subscribeButton'}
  ]