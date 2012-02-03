require('lib/setup')

Spine = require('spine')
SolarSystem = require('models/solarsystem')


class App extends Spine.Stack
  controllers:
    'home'   : "HomeController"
    'create' : "EditorController"
    "view"   : "ViewController"

  constructor: ->
    super
 
module.exports = App
    