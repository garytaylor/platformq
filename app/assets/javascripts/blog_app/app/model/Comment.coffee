Ext.define 'BlogAppMain.model.Comment',
  extend: 'Ext.data.Model'
  fields: [
    {name: 'body', type: 'string'},
    {name: 'author', type: 'string'},
    {name: 'posted_on', type: 'date'}
  ]
  proxy:
    type: 'rest'
    url: '/articles/:article_id/comments'