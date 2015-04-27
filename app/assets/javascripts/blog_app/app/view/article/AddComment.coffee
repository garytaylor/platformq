Ext.define 'BlogAppMain.view.article.AddComment',
  extend: 'Ext.form.Panel'
  alias: 'widget.addcomment'
  requires: [
    'BlogAppMain.view.article.AddCommentModel'
    'BlogAppMain.view.article.AddCommentController'
  ]
  config:
    article: undefined
  viewModel: 'addcomment'
  controller: 'addcomment'
  items: [
    {xtype: 'textarea', width: 400, height: 300, fieldLabel: 'Comment', bind: '{currentComment.body}'}
  ]
  bbar: [
    {xtype: 'tbfill'}
    {xtype: 'button', text: 'Cancel', itemId: 'cancelButton'}
    {xtype: 'button', text: 'OK', itemId: 'okButton'}

  ]
