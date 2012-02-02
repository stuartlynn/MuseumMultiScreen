Spine = require('spine')

class SolarSystem extends Spine.Model
  @configure 'SolarSystem', 'creator', 'planets', 'star'
  @extend Spine.Model.Ajax
  
  whomademe:->
    @creator

        
module.exports = SolarSystem