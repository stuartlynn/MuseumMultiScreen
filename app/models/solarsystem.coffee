Spine = require('spine')
require('spine/lib/ajax')

class SolarSystem extends Spine.Model
  @configure 'SolarSystem', 'creator', 'planets', 'star'
  @extend Spine.Model.Ajax
  
  whomademe:->
    @creator


module.exports = SolarSystem