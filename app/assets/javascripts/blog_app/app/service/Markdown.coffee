###*
# This service is a wrapper around the markdown converter.  The idea here is so that we do not end up with
# calls to the markdown converter deep within our code base, instead, everything goes through this service.
# This assists in the typicalk agile approach where we implement what is nescessary for the minimum viable product,
# but if we find that the markdown converter we have chosen is not suitable when we start adding more features later
# down the line, then we change this service rather than searching through the code base for usage of the markdown
# converter.
###
Ext.define 'BlogAppMain.service.Markdown',
  singleton: true
  convertToHtml: (markdown) ->
    @getConverter().makeHtml(markdown)
  getConverter: ->
    @_converter ||= new Markdown.Converter()