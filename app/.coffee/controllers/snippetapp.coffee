class SnippetApp extends Spine.Controller
  elements:  # 定义对象内元素
    '.snippet-name input': 'snippetName'
    '.snippet-code textarea': 'snippetCode'
    '.snippet-description input': 'snippetDescription'
    '.snippet-list .list': 'snippetList'
  
  events:  # 定义对象内事件
    'click #action-add-snippet': 'create'
    'click #action-reset-snippet': 'reset'
    'click #action-del-all': 'deleteAll'
   
  constructor: ->  # 构造函数
    super
    Snippet.bind("create",  @appendOne)
    Snippet.bind("refresh", @appendAll)
    Snippet.fetch()
    @log 'SnippetApp_controller init'

  create: =>
    now = new Date()
    Snippet.create(
      name: @snippetName.val()
      code: @snippetCode.val()
      description: @snippetDescription.val()
      timestamp: now.getTime()
    )
    @reset()

  appendOne: (snippet) =>
    SnippetOne = new Snippets(item: snippet)
    @snippetList.append(SnippetOne.el)

  appendAll: =>
    Snippet.each(@appendOne)

  refreshList: ->
    @log 'refreshList'
    options = item: '<li><a class="name"></a></li>'
    values = [
      {name: 'python'}
      {name: 'ruby'}
    ]
    snippetList = new List('snippet-list', options, values)

  reset: ->
    @log Snippet.first().toString()
    # @log Snippet.each (i)->i.toString()
    @snippetName.val('')
    @snippetCode.val('')
    @snippetDescription.val('')

  deleteAll: ->
    Snippet.each (item) => item.destroy()
    @snippetList.empty()
    
$ ->
  new SnippetApp(el: $("#tasks"))