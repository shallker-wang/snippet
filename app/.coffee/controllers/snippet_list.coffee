class SnippetList extends Spine.Controller

  tag: 'div'
  className: 'spine-list'
  tpl: '#tpl-snippet-list'

  indexList: ''

  elements:
    'ul': 'list'

  events:
    'click [action="add-snippet"]': 'goAddSnippet'
    'click [action="del-snippet-all"]': 'deleteAll'
    'input [action="search-snippet"]': 'fuzzySearch'

  constructor: ->
    super
    
    @el.append($(@tpl).clone().html())
    @refreshElements()

    Snippet.bind("refresh", @appendAll)
    Snippet.fetch()
    # @index()

  appendOne: (item) =>
    @list.append("<li><a><span class='snippet-name'>#{item.name}</span> - <span class='snippet-desc'>#{item.description}</span></a></li>")

  appendAll: (items) =>
    @appendOne(item) for item in items

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