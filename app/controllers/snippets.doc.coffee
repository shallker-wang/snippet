Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')

require('lib/jquery/plugin/jquery.autosize')

class SnippetsDoc extends Spine.Controller

  view: require('views/doc')()

  elements:
    '#snippet-doc': 'doc'
    '#snippet-code': 'code'

  events:
    'click #a-update': 'update'
    'click #a-back': 'navEdit'

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
    return unless @snippet.updateAttributes(
      doc: @doc.val()
      code: @editor.getSession().getValue()
    )

  live: ->
    @editor = ace.edit("ace-editor")
    @editor.getSession().setMode("ace/mode/typescript")

    height = @editor.getSession().getDocument().getLength() *
      @editor.renderer.lineHeight + @editor.renderer.scrollBar.getWidth();
    $('#ace-editor').height(height)

    $('#snippet-doc').autosize();

  navList: -> @navigate '/list'
  navEdit: (ev) -> @navigate "/edit/#{@snippet.id}"

module.exports = SnippetsDoc