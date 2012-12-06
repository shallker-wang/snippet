require('lib/setup')

Spine = require('spine')
Navbar = require('controllers/snippets.navbar')
Container = require('controllers/snippets.container')

# create = require('views/snippet_list')()
# doT = require('lib/dot/doT')
# console.log doT

class App extends Spine.Controller

  constructor: ->
    super

    @navbar = new Navbar
    @container = new Container
    @append @navbar, @container
    
    Spine.Route.setup()

module.exports = App
    