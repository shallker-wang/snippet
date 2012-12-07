Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')
require('lib/jquery/plugin/jquery.autosize')

class SnippetsEdit extends Spine.Controller

  view: require('views/edit')()

  elements:
    '#snippet-name': 'name'
    '#snippet-description': 'description'

  events:
    'click #a-update': 'update'
    'click #a-delete': 'delete'

  constructor: ->
    super
    Snippet.fetch()
    @html @render @load()
    @live()

  load: ->
    @snippet = Snippet.find @id
    @snippet

  render: (data) ->
    render = doT.template @view
    render data

  update: (ev) ->
    @snippet.updateAttributes
      name: @name.val()
      code: @editor.getSession().getValue()
      description: @description.val()
    @navList()

  delete: (ev) ->
    @snippet.destroy()
    @navList()

  live: ->
    @editor = ace.edit("ace-editor")
    @editor.getSession().setMode("ace/mode/typescript")

    # eleEditor = document.getElementById('ace-editor')
    # height = @editor.getSession().getDocument().getLength() *
    #   @editor.renderer.lineHeight + @editor.renderer.scrollBar.getWidth();
    # $('#ace-editor').height(height)

    # $('#snippet-annotation').autosize();

  navList: -> @navigate '/list'

module.exports = SnippetsEdit