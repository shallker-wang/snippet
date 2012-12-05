class SnippetList extends Spine.Controller

  tag: 'div'
  className: 'spine-list'
  tpl: '#tpl-snippet-list'
  view: 'snippet_list.view'

  indexList: ''

  elements:
    'ul': 'list'

  events:
    'click [action="add-snippet"]': 'goAddSnippet'
    'click [action="del-snippet-all"]': 'deleteAll'
    'input [action="search-snippet"]': 'fuzzySearch'

  constructor: ->
    super
    
    Snippet.bind("refresh", @build)
    Snippet.fetch()
    # @index()

  build: (snippets) =>
    @tpl = @loadView()
    @snippets = snippets
    @el.append @render()

  render: () =>
    @doT @tpl, @snippets

  doT: (tpl, data) ->
    render = doT.template tpl
    render data

  loadView: ->
    @xhr
      url: "scripts/app/views/#{@view}"
      async: false

  deleteAll: ->
    @log 'SnippetList.deleteAll()'
    @navigate('/list')

  index: =>
    fuzzyOptions =
      searchClass: "snippet-search",
      location: 0,
      distance: 100,
      threshold: 0.4,
      multiSearch: true
    options =
      valueNames: ['snippet-name', 'snippet-desc']
      plugins: [['fuzzySearch', fuzzyOptions]]
    @indexList = new List('snippet-list', options)
    # @indexList.add({'snippet-name': 'from index'})

  fuzzySearch: (ev) ->
    @indexList.fuzzySearch(ev.target.value)
    # @log ev, ev.target.value

  goAddSnippet: ->
    @navigate('/add')

this.SnippetList = SnippetList