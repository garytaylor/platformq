###*
# The view for displaying the details of an article
###
Ext.define 'BlogAppMain.view.article.Article',
  extend: 'Ext.view.View'
  alias: 'widget.article'
  requires: [
    'BlogAppMain.view.article.ArticleController'
  ]
  controller: 'article'
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

