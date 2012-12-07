Spine   = require('spine')
$       = Spine.$

Create = require('controllers/snippets.create')
List = require('controllers/snippets.list')
Edit = require('controllers/snippets.edit')

class SnippetsContainer extends Spine.Controller
  
  className: 'container'

  constructor: ->
    super
    @routes
      '/': (para) ->
        @list = new List
        @html @list

      '/create': (para) -> 
        @create = new Create el: @el

      '/list': (para) ->
        @list = new List
        @html @list
        @list.index()

      '/edit/:id': (para) ->
        @edit = new Edit el: @el, id: para.id

module.exports = SnippetsContainer