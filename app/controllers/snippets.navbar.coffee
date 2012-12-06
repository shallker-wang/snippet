Spine   = require('spine')
$       = Spine.$

class Navbar extends Spine.Controller

  className: 'navbar'

  elements:
    'li': 'navs'
    '.nav-create': 'nav_create'
    '.nav-list': 'nav_list'

  events:
    'click .nav-create': 'navCreate'
    'click .nav-list': 'navList'
    
  constructor: ->
    super
    @routes
      '/create': @routeCreate
      '/list': @routeList

    @html require('views/navbar')()

  navCreate: (ev) ->
    ev.preventDefault()
    @navigate('/create')

  navList: (ev) ->
    ev.preventDefault()
    @navigate('/list')

  routeCreate: ->
    @active(@nav_create)

  routeList: ->
    @active(@nav_list)

  active: (nav) ->
    $(@navs).removeClass('active')
    $(nav).addClass('active')

module.exports = Navbar