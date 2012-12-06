Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')
require('lib/jquery/plugin/jquery.autosize')

class SnippetsEdit extends Spine.Controller

  elements:
    '#snippet-annotation': 'annotation'

  events:
    'click #a-save': 'save'

  constructor: (snippetId) ->
    super
    @html 
    @id = snippetId
    Snippet.fetch()
    # @el.append @render()
    # @refreshElements()
    @tpl = require('views/edit')()
    @snippet = Snippet.find @id
    @html @render @tpl, @snippet

  render: (tpl, data) ->
    render = doT.template tpl
    render data

  save: (ev) ->
    @snippet.updateAttributes
      annotation: @annotation.val()
      code: @editor.getSession().getValue()
    # @snippet.save()

  afterDOM: ->
    @editor = ace.edit("ace-editor")
    @editor.getSession().setMode("ace/mode/typescript")

    # eleEditor = document.getElementById('ace-editor')
    height = @editor.getSession().getDocument().getLength() *
      @editor.renderer.lineHeight + @editor.renderer.scrollBar.getWidth();
    $('#ace-editor').height(height)

    $('#snippet-annotation').autosize();

module.exports = SnippetsEdit