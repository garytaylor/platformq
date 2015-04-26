Ext.define 'BlogAppMain.view.articles.ArticlesModel',
  extend: 'Ext.app.ViewModel'
  requires: [
    'BlogAppMain.model.Article'
  ]
  alias: 'viewmodel.articles'
  stores:
    articles:
      model: 'BlogAppMain.model.Article'
      autoLoad: true
      proxy:
        type: 'rest'
        url: '/articles.json'
        reader:
          type: 'json'
          rootProperty: 'items'
