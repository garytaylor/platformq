###*
# A service to define how to show an article to a user and hide it again.
# This is used throughout the code as a standard way of showing and hiding
# an article in its full glory.
###
Ext.define 'BlogAppMain.service.Article',
  singleton: true
  requires: [
    'BlogAppMain.view.article.Article'
  ]
  showArticleBySlug: (slug, store) ->
    unless store.isLoaded()
      store.on 'load', @showArticleBySlug, @, {single: true, args: [slug, store]}
      return
    filteredStore = Ext.create 'Ext.data.ChainedStore', {source: store}
    filteredStore.filter('url_slug', slug)
    if @getViewerWindow()
      @getViewerWindow().lookupReference('article')?.setStore(filteredStore)
    else
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