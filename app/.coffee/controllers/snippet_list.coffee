class SnippetList extends Spine.Controller

  tag: 'div'
  className: 'spine-list'
  tpl: '#tpl-snippet-list'

  elements:
    'ul': 'list'

  constructor: ->
    super
    
    @el.append($(@tpl).clone().html())
    @refreshElements()

    Snippet.bind("refresh", @appendAll)
    Snippet.fetch()

  appendOne: (item)=>
    @list.append("<li><a>#{item.name}</a></li>")

  appendAll: (items)=>
    @appendOne(item) for item in items

this.SnippetList = SnippetList