Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
Create = require('controllers/snippets.create')
List = require('controllers/snippets.list')
Edit = require('controllers/snippets.edit')
Doc = require('controllers/snippets.doc')

class SnippetsContainer extends Spine.Controller
  
  className: 'container'

  constructor: ->
    super
    @routes
      '/': (para) ->
        @list = new List
        @html @list

      '/create': (para) -> 
        @create = new Create
        @html @create
        @create.live()

      '/list': (para) ->
        @list = new List
        @html @list
        @list.index()

      '/edit/:id': (para) ->
        @edit = new Edit(para.id)
        @html @edit
        @edit.live()

      '/doc/:id': (para) ->
        @doc = new Doc(para.id)
        @html @doc
        @doc.live()

module.exports = SnippetsContainer