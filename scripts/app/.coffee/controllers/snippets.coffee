class Snippets extends Spine.Controller

  tag: 'li'
   
  constructor: ->  # 构造函数
    super
    @log 'snippets_controller init'
    @append("<a>#{@item.name}</a>")

  add: ->
    now = new Date()
    Snippet.create(
      name: @snippetName.val()
      code: @snippetCode.val()
      description: @snippetDescription.val()
      timestamp: now.getTime()
    )

  reset: ->
    @snippetName.val('')
    @snippetCode.val('')
    @snippetDescription.val('')
    @log Snippet.all()

this.Snippets = Snippets