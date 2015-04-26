###* The UI controller for the articles
#
###
Ext.define 'BlogAppMain.view.articles.ArticlesController',
  extend: 'Ext.app.ViewController'
  alias: 'controller.articles'
  requires: [
    'BlogAppMain.service.Article'
  ]
  config:
    control:
      'articles dataview':
        itemdblclick: 'onArticleDblClick'
      'articles #addArticleButton':
        click: 'onAddArticleButtonClick'
  routes:
    'articles/:url_slug': 'showArticleBySlug'
    'articles': 'showArticles'
  ###*
  # @private
  # Called when the user double clicks on an 'item' (an article)
  # @param {BlogAppMain.view.articles.Articles} widget The articles widget that fired the event
  # @param {BlogAppMain.model.Article} article The article that the user double clicked on
  ###
  onArticleDblClick: (widget, article) ->
    this.redirectTo("articles/#{article.get('url_slug')}")
  showArticleBySlug: (slug) ->
    BlogAppMain.service.Article.showArticleBySlug(slug, @getViewModel().get('articles'))
  showArticles: ->
    # The list of articles are always shown anyway, just may be covered by the article viewer.
    BlogAppMain.service.Article.hideArticleViewer()
  getArticleViewer: ->
    @_articleViewer
  onAddArticleButtonClick: ->
    BlogAppMain.service.Article.showAddArticleWindowForStore(@getViewModel().get('articles'))


