Ext.define 'BlogAppMain.view.main.Main',
  extend: 'Ext.container.Container'
  requires: [
    'BlogAppMain.view.articles.Articles'
    'BlogAppMain.view.subscription.SubscriptionCreate'
  ]
  layout:
    type: 'border'
  items: [
    {
      region: 'north'
      xtype: 'subscriptioncreate'
      height: 100
    },
    {
      region: 'center'
      xtype: 'articles'
    }
  ]
