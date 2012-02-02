module.exports = (redisClient)->
  routes =
    
    show : (req,res)->
      redisClient.set 'solarsystem_ids', req.params.solarsystem
      res.send('Hello World '+ req.params.solarsystem);
    
    create : (req, res)->
      console.log ("solar system create")
      solarsystem = req.body
      solarsystem.id= 10
      res.send solarsystem
    
    update : (req,res)->
      console.log ("solar system update")

    index : (req,res)->
      console.log ("solar system index")
      redisClient.get 'solarsystem_ids', (err, result)=>
        res.send('the last set was '+result)