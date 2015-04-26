Ext.define 'BlogAppMain.view.article.ArticleEditor',
  extend: 'Ext.panel.Panel'
  alias: 'widget.articleedit'
  requires: [
    'BlogAppMain.view.article.ArticleEditorModel'
    'BlogAppMain.view.article.ArticleEditorController'
  ]
  layout:
    type: 'border'
  header: false
  viewModel: 'articleeditor'
  controller: 'articleeditor'
  items: [
    {
      region: 'center'
      xtype: 'form'
      defaults:
        width: '75%'
      items: [
        fieldLabel: 'Title'
        xtype: 'textfield'
        bind:
          value: '{article.title}'
      ,
        fieldLabel: 'Url "Slug"'
        xtype: 'textfield'
        bind:
          value: '{article.url_slug}'
      ,
        fieldLabel: 'Body (Markdown)'
        xtype: 'textarea'
        height: '50%'
        bind:
          value: '{article.body}'
      ]
    },
    {
      region: 'east'
      width: '50%'
      xtype: 'panel'
      title: 'Preview'
      layout: 'fit'
      items: [
        xtype: 'article'
        bind:
          store: '{articles}'
      ]
    }

  ]
  bbar: [
    {xtype: 'tbfill'},
    {xtype: 'button', text: 'Cancel', itemId: 'cancelButton'}
    {xtype: 'button', text: 'OK', itemId: 'okButton'}
  ]