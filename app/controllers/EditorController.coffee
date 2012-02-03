class  EditorController  extends Spine.Controller
  className : "editorScreen"

  constructor: ->
    super
    @render()

  render:->
    @html require('views/editor')()
  
module.exports = EditorController