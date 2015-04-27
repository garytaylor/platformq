Ext.define 'BlogAppMain.view.article.AddCommentModel',
  extend: 'Ext.app.ViewModel'
  requires: [
    'BlogAppMain.model.Comment'
  ]
  alias: 'viewmodel.addcomment'
  formulas:
    comment:
      get: ->
        @_currentComment ||= @get('comments').getAt(0)
  stores:
    comments:
      model: 'BlogAppMain.model.Comment'
      data: [{}]

