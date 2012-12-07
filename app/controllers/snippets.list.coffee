Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT     = require('lib/dot/doT')

require('lib/list/list.min')
require('lib/list/plugin/list.fuzzySearch.min')

class SnippetsList extends Spine.Controller

  view: require('views/list')()

  elements:
    '#snippet-list': 'list'

  events:
    'click #a-add': 'navAdd'
    'click #snippet-list li': 'edit'
    'input #snippet-search': 'fuzzySearch'

  constructor: ->
    super
    
    Snippet.fetch()
    @html @render @load()

  load: ->
    Snippet.all()

  render: (data) ->
    render = doT.template @view
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

  navAdd: -> @navigate '/create'
  
module.exports = SnippetsList