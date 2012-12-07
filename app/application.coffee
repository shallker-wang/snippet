require('lib/setup')

Spine = require('spine')
# Navbar = require('controllers/snippets.navbar')
Container = require('controllers/snippets.container')

class App extends Spine.Controller

  constructor: ->
    super

    # @navbar = new Navbar
    @container = new Container
    @append @container
    
    Spine.Route.setup()

module.exports = App
    