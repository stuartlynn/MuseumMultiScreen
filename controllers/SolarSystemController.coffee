SolarSystem = require("../app/models/solarsystem")

module.exports = (redisClient)->

  SolarSystem = require("../lib/redisify")({redis:redisClient, model:SolarSystem})

  routes =
    show : (req,res)->
      SolarSystem.redisFind req.params.solarsystem, (solar)->
        res.send solar.toJSON()
    
    create : (req, res)->
      console.log ("solar system create")
      solarsystem = new SolarSystem(req.body)
      solarsystem.redisSave()
      res.send solarsystem
    
    update : (req,res)->
      console.log ("solar system update")

    index : (req,res)->
      SolarSystem.redisAll (result)->
        res.send(result)