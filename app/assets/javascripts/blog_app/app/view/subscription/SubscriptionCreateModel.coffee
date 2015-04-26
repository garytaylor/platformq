Ext.define 'BlogAppMain.view.subscription.SubscriptionCreateModel',
  extend: 'Ext.app.ViewModel'
  requires: [
    'BlogAppMain.model.Subscription'
  ]
  alias: 'viewmodel.subscriptioncreate'
  formulas:
    subscription:
      get: ->
        @_currentSubscription ||= @get('subscriptions').getAt(0)
  stores:
    subscriptions:
      model: 'BlogAppMain.model.Subscription'
      data: [{}]

