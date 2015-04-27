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
            <div class='comments'>
              <div class='header'>
                <span>Comments: </span>
              </div>
              <tpl for='comments'>
                <div class='comment'>
                  <div class='header'>
                    <span class='author'>{author}</span>
                    <span class='posted_on'>{posted_on}</span>
                    <div class='content'>{body}</div>
                  </div>
                </div>
              </tpl>
              <div class='comment-toolbar'>
                <a data-action='addComment' class='x-btn x-unselectable x-toolbar-item x-btn-default-toolbar-small'>
                  <span class='x-btn-wrap x-btn-wrap-default-toolbar-small'>
                    <span class='x-btn-button x-btn-button-default-toolbar-small x-btn-text    x-btn-button-center'>
                      <span class='x-btn-inner x-btn-inner-default-toolbar-small'>Add Comment</span>
                    </span>
                  </span>
                </a>
              </div>
            </div>

          </div>
        </tpl>
    </div>"
  itemSelector: '.article'

