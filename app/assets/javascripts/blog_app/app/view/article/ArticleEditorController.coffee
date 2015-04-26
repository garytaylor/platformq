Ext.define 'BlogAppMain.view.article.ArticleEditorController',
  extend: 'Ext.app.ViewController'
  requires: [

  ]
  alias: 'controller.articleeditor'
  control:
    'articleedit #okButton':
      click: 'onOkButtonClick'
    'articleedit #cancelButton':
      click: 'onCancelButtonClick'
  onOkButtonClick: ->
    @getViewModel().get('articles').sync success: =>
      BlogAppMain.service.Article.hideAddArticleWindow()
  onCancelButtonClick: ->
    BlogAppMain.service.Article.hideAddArticleWindow()
