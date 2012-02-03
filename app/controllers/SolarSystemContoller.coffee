Spine = require('spine')

class SolarSystemController  extends Spine.Controller

  constructor: ->
    super
    @render()

  render:->
    @html require('views/solarsystem')()
  

module.exports = SolarSystemController
