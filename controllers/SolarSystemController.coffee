module.exports = (redisClient)->
  routes =
    show : (req,res)->
      redisClient.set 'solarsystem_ids', req.params.id
      res.send('Hello World '+ req.params.id);
    create : (req, res)->
      solarsystem = req.body
      console.log solarsystem
      solarsystem.id= 10
      console.log solarsystem
      res.send solarsystem
    update : (req,res)->
      comsole.log("updating solar system")
    index : (req,res)->
      redisClient.get 'solarsystem_ids', (err, result)=>
        res.send('the last set was '+result)