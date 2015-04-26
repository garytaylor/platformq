Ext.define 'BlogAppMain.view.subscription.SubscriptionCreateController',
  extend: 'Ext.app.ViewController'
  requires: [

  ]
  alias: 'controller.subscriptioncreate'
  control:
    'subscriptioncreate #subscribeButton':
      click: 'onSubscribeButtonClick'
  onSubscribeButtonClick: ->
    @getViewModel().get('subscriptions').sync success: =>
      Ext.Msg.alert('Subscribed', 'You have been successfully subscribed.')
