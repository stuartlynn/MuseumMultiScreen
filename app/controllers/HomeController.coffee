Spine = require('spine')

class HomeController  extends Spine.Controller

  className: "homeScreen"

  elements : 
    "beginButton": 'begin'

  constructor: ->
    super
    @render()

  render:->
    @html require('views/home')()
  
  begin:->
    Spine.Route.navigate('/')

module.exports = HomeController
