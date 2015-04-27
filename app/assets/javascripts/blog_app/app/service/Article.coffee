###*
# A service to define how to show an article to a user and hide it again.
# This is used throughout the code as a standard way of showing and hiding
# an article in its full glory.
###
Ext.define 'BlogAppMain.service.Article',
  singleton: true
  requires: [
    'BlogAppMain.view.article.Article'
    'BlogAppMain.view.article.ArticleEditor'
    'BlogAppMain.view.article.AddComment'
  ]
  showArticleBySlug: (slug, store) ->
    unless store.isLoaded()
      store.on 'load', @showArticleBySlug, @, {single: true, args: [slug, store]}
      return
    filteredStore = Ext.create 'Ext.data.ChainedStore', {source: store}
    filteredStore.filter('url_slug', slug)
    @createViewerWindowForStore(filteredStore)
    @getViewerWindow().show()
  hideArticleViewer: ->
    @getViewerWindow()?.close()
    @getViewerWindow()?.destroy()
    delete @_viewerWindow
  getViewerWindow: ->
    @_viewerWindow
  createViewerWindowForStore: (store) ->
    @_viewerWindow ||= Ext.widget 'window',
      title: "Article - #{store.getAt(0)?.get('title')}"
      modal: true
      items: [
        reference: 'article'
        xtype: 'article'
        store: store
      ]
      maximized: true
  showAddArticleWindowForStore: (store) ->
    @createAddArticleWindowForStore(store)
    @_addArticleWindow.show()
  hideAddArticleWindow: ->
    @_addArticleWindow?.close()
    @_addArticleWindow?.destroy()
    delete @_addArticleWindow
  createAddArticleWindowForStore: (store) ->
    @_addArticleWindow ||= Ext.widget 'window',
      title: 'New Article'
      modal: true
      layout: 'fit'
      items: [
        reference: 'articleEditor'
        xtype: 'articleedit'
        store: store
      ]
      maximized: true
  showAddCommentWindowForArticle: (article) ->
    @createAddCommentWindowForArticle(article)
    @_addCommentWindow.show()
  createAddCommentWindowForArticle: (article) ->
    @_addCommentWindow ||= Ext.widget 'window',
      title: 'Add Comment'
      modal: true
      layout: 'fit'
      items: [
        xtype: 'addcomment'
        article: article
      ]
  hideAddCommentWindow: ->
    @_addCommentWindow?.close()
    @_addCommentWindow?.destroy()
    delete @_addCommentWindow