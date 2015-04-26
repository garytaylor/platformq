Ext.define 'BlogAppMain.view.article.ArticleEditorModel',
  extend: 'Ext.app.ViewModel'
  requires: [
    'BlogAppMain.model.Article'
  ]
  alias: 'viewmodel.articleeditor'
  formulas:
    article:
      get: ->
        @_currentArticle ||= @get('articles').getAt(0)
  stores:
    articles:
      model: 'BlogAppMain.model.Article'
      data: [{}]

