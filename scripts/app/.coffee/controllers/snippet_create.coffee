class SnippetCreate extends Spine.Controller

  tag: 'div'
  className: 'snippet-create'
  view: 'snippet_create.view'

  elements:
    '.snippet-name input': 'snippetName'
    '.snippet-code textarea': 'snippetCode'
    '.snippet-description input': 'snippetDescription'
    '.snippet-list .list': 'snippetList'

  events:
    'click [action="add-snippet"]': 'create'
    'click [action="reset-snippet"]': 'reset'
    'click [action="snippet-list"]': 'goSnippetList'

  constructor: ->
    super
    @el.append @render @loadView()
    @refreshElements()

  loadView: ->
    @xhr
      url: "scripts/app/views/#{@view}"
      async: false

  render: (tpl) ->
    tpl

  create: ->
    console.log 'create'
    now = new Date()
    Snippet.create
      name: @snippetName.val()
      code: @snippetCode.val()
      description: @snippetDescription.val()
      annotation: 'first line'
      timestamp: now.getTime()
    @navigate('/list')
    # @reset()

  reset: ->
    @snippetName.val('')
    @snippetCode.val('')
    @snippetDescription.val('')

  goSnippetList: -> @navigate('/list')

this.SnippetCreate = SnippetCreate