###*
# The model to represent an article
###
Ext.define 'BlogAppMain.model.Article',
  extend: 'Ext.data.Model',
  fields: [
    {name: 'url_slug', type: 'string'},
    {name: 'title', type: 'string'},
    {name: 'posted_on', type: 'date'},
    {name: 'author', type: 'string'},
    {name: 'body', type: 'string'},
    {name: 'body_content_type', type: 'string'}
  ]