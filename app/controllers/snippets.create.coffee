Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')

class SnippetsCreate extends Spine.Controller

  view: require('views/create')()

  elements:
    '#snippet-name': 'name'
    '#snippet-description': 'description'

  events:
    'click #a-save': 'save'
    'click #a-list': 'navList'

  constructor: ->
    super
    Snippet.fetch()
    @html @render()

  render: ->
    @view

  live: ->
    @editor = ace.edit("ace-editor")
    @editor.getSession().setMode("ace/mode/typescript")

  save: ->
    return alert 'Snippet name is required.' unless @name.val()
    now = new Date()
    return unless Snippet.create (
      name: @name.val()
      code: @editor.getSession().getValue()
      doc: ''
      description: @description.val()
      timestamp: now.getTime()
    )
    @navList()

  navList: -> @navigate '/list'

module.exports = SnippetsCreate