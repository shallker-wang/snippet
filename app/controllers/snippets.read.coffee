Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')

class SnippetsRead extends Spine.Controller

  constructor: (snippetId) ->
    super
    @id = snippetId
    Snippet.fetch()
    # @el.append @render()
    # @refreshElements()
    @tpl = require('views/view')()
    @snippet = Snippet.find @id
    @html @render @tpl, @snippet

  render: (tpl, data) ->
    render = doT.template tpl
    render data

  afterDOM: ->
    editor = ace.edit("ace-editor")
    editor.getSession().setMode("ace/mode/typescript")

    height = editor.getSession().getDocument().getLength() * 
        editor.renderer.lineHeight + editor.renderer.scrollBar.getWidth()
    $('#ace-editor').height(height)


module.exports = SnippetsRead