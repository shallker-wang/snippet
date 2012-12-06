Spine   = require('spine')
$       = Spine.$

Create = require('controllers/snippets.create')
List = require('controllers/snippets.list')
Edit = require('controllers/snippets.edit')

class SnippetsContainer extends Spine.Controller
  
  className: 'container-fluid'

  constructor: ->
    super

    @routes
      '/create': (para) -> 
        @create = new Create
        @html @create

      '/list': (para) ->
        @list = new List
        @html @list
        @list.index()

      '/edit/:id': (para) ->
        @edit = new Edit(para.id)
        @html @edit
        @edit.afterDOM()
        
module.exports = SnippetsContainer