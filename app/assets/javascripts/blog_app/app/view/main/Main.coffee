Ext.define 'BlogAppMain.view.main.Main',
  extend: 'Ext.container.Container'
  requires: [
    'BlogAppMain.view.articles.Articles'
  ]
  layout:
    type: 'border'
  items: [
    {
      region: 'north'
      html: 'Subscribe Here'
      height: 100
    },
    {
      region: 'center'
      xtype: 'articles'
    }
  ]