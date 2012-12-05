class SnippetEdit extends Spine.Controller

  id: ''
  tag: 'div'
  className: 'snippet-edit'
  view: 'snippet_edit.view'
  tpl: '#tpl-snippet-edit'

  constructor: (id) ->
    super
    @id = id
    Snippet.fetch()
    @el.append @render()
    @refreshElements()

  render: ->
    @tpl = @loadView()
    @snippet = Snippet.find(@id)
    @dot @tpl, @snippet

  dot: (tpl, data) ->
    render = doT.template tpl
    render data

  afterDOM: ->
    editor = ace.edit("ace-editor")
    editor.getSession().setMode("ace/mode/typescript")

    eleEditor = document.getElementById('ace-editor')
    eleEditor.style.height = editor.getSession().getDocument().getLength() * editor.renderer.lineHeight + editor.renderer.scrollBar.getWidth() + 'px';

    $('#snippet-annotation').autosize();

  loadView: ->
    @xhr
      url: "scripts/app/views/#{@view}"
      async: false

this.SnippetEdit = SnippetEdit