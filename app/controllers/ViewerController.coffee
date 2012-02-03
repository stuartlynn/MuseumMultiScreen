Spine = require('spine')

class  ViewerController  extends Spine.Controller
  className : "viewScreen"

  constructor: ->
    super
    @render()

  render:->
    @html require('views/viewer')()
  
module.exports = ViewerController
