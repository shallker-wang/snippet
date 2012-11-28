class SnippetApp extends Spine.Controller
   
  constructor: ->  # 构造函数
    super
    @el = $('#snippet-app')

    @routes
      "/add": ->
        console.log "routes: /add"
        @html new SnippetCreate()
      "/list": -> 
        console.log "routes: /list"
        @html new SnippetList()

    Spine.Route.setup()
    
    # Snippet.bind("create",  @appendOne)
    # Snippet.bind("refresh", @appendAll)
    # Snippet.fetch()
    @log 'SnippetApp_controller init'

  refreshList: ->
    @log 'refreshList'
    options = item: '<li><a class="name"></a></li>'
    values = [
      {name: 'python'}
      {name: 'ruby'}
    ]
    snippetList = new List('snippet-list', options, values)
    
$ -> new SnippetApp()