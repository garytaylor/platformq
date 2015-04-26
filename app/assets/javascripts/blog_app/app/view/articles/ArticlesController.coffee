###* The UI controller for the articles
#
###
Ext.define 'BlogAppMain.view.articles.ArticlesController',
  extend: 'Ext.app.ViewController'
  alias: 'controller.articles'
  config:
    control:
      'articles':
        itemdblclick: 'onArticleDblClick'
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
    debugger
  showArticles: ->
    debugger;

