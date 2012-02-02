require('lib/setup')

Spine = require('spine')
SolarSystem = require('models/solarsystem')


class App extends Spine.Controller
  events:
    "click .new_solar_system" : "createSolar"

  constructor: ->
    super
  
  createSolar: =>
    alert("here")
    s = new SolarSystem({creator:"me", planets:[], star: {mag:10, mass: 20}})
    s.save()

module.exports = App
    