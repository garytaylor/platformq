Ext.define 'BlogAppMain.view.articles.Articles',
  extend: 'Ext.view.View'
  alias: 'widget.articles'
  requires: [
    'BlogAppMain.view.articles.ArticlesModel',
    'BlogAppMain.view.articles.ArticlesController',

  ]
  viewModel: 'articles'
  controller: 'articles'
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
              <div class='content'>{body}</div>
            </div>
          </tpl>
      </div>"
  itemSelector: '.article'