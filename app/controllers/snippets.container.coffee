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
        @create = new Create el: @el

      '/list': (para) ->
        @list = new List
        @html @list
        @list.index()

      '/edit/:id': (para) ->
        @edit = new Edit el: @el, id: para.id

      '/doc/:id': (para) ->
        @doc = new Doc el: @el, id: para.id

    Snippet.bind "error", (rec, msg) ->
      alert("Sorry, " + msg)

module.exports = SnippetsContainer