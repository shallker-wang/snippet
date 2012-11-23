require('lib/setup')

Spine = require('spine')
Snippets = require('controllers/snippets')

class App extends Spine.Controller
  constructor: ->
    super
    @log 'index.coffee init'
    @snippets = new Snippets(el: $('.snippet'))

module.exports = App