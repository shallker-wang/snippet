Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')

class SnippetsEdit extends Spine.Controller

  view: require('views/edit')()

  elements:
    '#snippet-name': 'name'
    '#snippet-description': 'description'

  events:
    'click #a-update': 'update'
    'click #a-delete': 'delete'
    'click #a-document': 'navDoc'

  constructor: (id) ->
    super
    @id = id
    Snippet.fetch()
    @html @render @load()

  load: ->
    @snippet = Snippet.find @id
    @snippet

  render: (data) ->
    render = doT.template @view
    render data

  update: (ev) ->
    return unless @snippet.updateAttributes(
      name: @name.val()
      code: @editor.getSession().getValue()
      description: @description.val()
    )
    @success('Update sucessful.')

  success: (mesg) ->
    alert mesg

  delete: (ev) ->
    @snippet.destroy()
    @navList()

  live: ->
    @editor = ace.edit("ace-editor")
    @editor.getSession().setMode("ace/mode/typescript")

  navList: -> @navigate '/list'
  navDoc: -> @navigate "/doc/#{@id}"

module.exports = SnippetsEdit