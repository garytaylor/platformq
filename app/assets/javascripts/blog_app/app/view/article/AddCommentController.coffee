Ext.define 'BlogAppMain.view.article.AddCommentController',
  extend: 'Ext.app.ViewController'
  requires: [

  ]
  alias: 'controller.addcomment'
  control:
    'addcomment #okButton':
      click: 'onOkButtonClick'
    'addcomment #cancelButton':
      click: 'onCancelButtonClick'
  onOkButtonClick: ->
    store = @getView().getArticle().comments()
    store.add(@getViewModel().get('currentComment'))
    store.getModel().getProxy().setUrl("/articles/#{@getView().getArticle().get('id')}/comments")
    store.sync success: =>
      BlogAppMain.service.Article.hideAddCommentWindow()
  onCancelButtonClick: ->
    BlogAppMain.service.Article.hideAddCommentWindow()
