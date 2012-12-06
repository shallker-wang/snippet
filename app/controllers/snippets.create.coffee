Spine   = require('spine')
$       = Spine.$

Snippet = require('models/snippet')
doT = require('lib/dot/doT')

class SnippetsCreate extends Spine.Controller

  elements:
    '#snippet-name': 'name'
    '#snippet-code': 'code'
    '#snippet-description': 'description'

  events:
    'click #a-create': 'create'
    'click #a-reset': 'reset'
    'click #a-list': 'list'

  constructor: ->
    super
    @html require('views/create')()

  create: ->
    now = new Date()
    Snippet.create
      name: @name.val()
      code: @code.val()
      description: @description.val()
      annotation: "\n\r"
      timestamp: now.getTime()
    @list()

  reset: ->
    @name.val('')
    @code.val('')
    @description.val('')

  list: -> @navigate '/list'

module.exports = SnippetsCreate