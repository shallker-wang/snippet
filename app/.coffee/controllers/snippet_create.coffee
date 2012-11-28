class SnippetCreate extends Spine.Controller

  tag: 'div'
  className: 'snippet-create'
  tpl: '#tpl-snippet-add'

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
    @el.append($(@tpl).clone().html())
    @refreshElements()

  create: ->
    console.log 'create'
    now = new Date()
    Snippet.create(
      name: @snippetName.val()
      code: @snippetCode.val()
      description: @snippetDescription.val()
      timestamp: now.getTime()
    )
    @navigate('/list')
    # @reset()

  reset: ->
    @snippetName.val('')
    @snippetCode.val('')
    @snippetDescription.val('')

  goSnippetList: -> @navigate('/list')

this.SnippetCreate = SnippetCreate