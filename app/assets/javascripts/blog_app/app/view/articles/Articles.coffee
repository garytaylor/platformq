Ext.define 'BlogAppMain.view.articles.Articles',
  extend: 'Ext.container.Container'
  alias: 'widget.articles'
  requires: [
    'BlogAppMain.view.articles.ArticlesModel',
    'BlogAppMain.view.articles.ArticlesController',
    'BlogAppMain.service.Markdown',
    'Ext.view.View'

  ]
  viewModel: 'articles'
  controller: 'articles'
  items: [
    xtype: 'dataview'
    bind:
      store: '{articles}',
    tpl: "<div class='articles'>
          <tpl for='.'>
            <div class='article'>
              <div class='header'>
                <span class='author'>{author}</span>
                <span class='posted_on'>{posted_on}</span>
                <div class='title'>{title}</div>
              </div>
              <div class='content'>{[BlogAppMain.service.Markdown.convertToHtml(values.body)]}</div>
            </div>
          </tpl>
      </div>"
    itemSelector: '.article'
  ]
