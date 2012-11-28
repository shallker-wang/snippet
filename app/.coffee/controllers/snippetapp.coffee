class SnippetApp extends Spine.Controller
   
  constructor: ->  # 构造函数
    super
    @el = $('#snippet-app')

    @routes
      "/add": ->
        @html new SnippetCreate()
      "/list": -> 
        SL = new SnippetList()
        @html SL
        SL.index()
        # options =
        #   valueNames: ['snippet-name']
        # index = new List('snippet-list', options)
        # index.add({'snippet-name': 'from index'})

    Spine.Route.setup()
    @navigate('/add')
    
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