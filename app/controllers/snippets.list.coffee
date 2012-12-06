Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT     = require('lib/dot/doT')

require('lib/list/list.min')
require('lib/list/plugin/list.fuzzySearch.min')

class SnippetsList extends Spine.Controller

  elements:
    '#snippet-list': 'list'

  events:
    'click #a-add': 'add'
    'click #a-del-all': 'delAll'
    'click #snippet-list li': 'edit'
    'input #snippet-search': 'fuzzySearch'

  constructor: ->
    super
    Snippet.bind("refresh", @build)
    Snippet.fetch()
    # @index()

  build: (snippets) =>
    @tpl = require('views/list')()
    @snippets = snippets
    @html @render @tpl, @snippets

  render: (tpl, data) ->
    render = doT.template tpl
    render data

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

  edit: (ev) ->
    ev.preventDefault()
    id = ev.currentTarget.id
    @navigate "/edit/#{id}"

  add: -> @navigate '/create'
  
  delAll: ->
    @log 'delete all'

module.exports = SnippetsList