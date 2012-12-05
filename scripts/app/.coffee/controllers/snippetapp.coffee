class SnippetApp extends Spine.Controller
   
  constructor: ->
    super
    @el = $('#snippet-app')

    @routes
      "/add": ->
        @html new SnippetCreate()
      
      "/list": -> 
        list = new SnippetList()
        @html list
        list.index()
      
      "/edit/:id": (para) ->
        edit = new SnippetEdit(para.id)
        @html edit.el[0].innerHTML
        edit.afterDOM()

    Spine.Route.setup()
    # @navigate('/add')
    
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