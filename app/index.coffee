require('lib/setup')

Spine = require('spine')
SolarSystem = require('models/solarsystem')
HomeController   = require("controllers/HomeController")
EditorController = require("controllers/EditorController")
ViewerController   = require("controllers/ViewerController")

class App extends Spine.Stack
  controllers:
    home       : HomeController
    create     : EditorController
    view       : ViewerController

  routes:
    '/'         : 'home'
    '/editor'   : 'create'
    '/view/:id' : 'view'

  default : 'home'

  constructor: ->
    super
    Spine.Route.setup()

module.exports = App
    