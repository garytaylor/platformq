Ext.define 'BlogAppMain.view.article.ArticleController',
  extend: 'Ext.app.ViewController'
  requires: []
  alias: 'controller.article'
  init: ->
    @controlForDom()
  controlForDom: ->
    if !@getView().getEl()
      @getView().on 'refresh', @controlForDom, @, {single: true}
      return
    @getView().getEl().down('a[data-action=addComment]').on('click', @onAddCommentButtonClick, @)
  onAddCommentButtonClick: (e) ->
    e.preventDefault();
    BlogAppMain.service.Article.showAddCommentWindowForArticle(@getView().getStore().getAt(0))

