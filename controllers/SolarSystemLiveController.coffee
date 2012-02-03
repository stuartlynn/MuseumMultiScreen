SolarSystem = require("../app/models/solarsystem")

module.exports = (redisClient)->
  console.log("test")
  console.log "rockets"
  socketsio = require('socket.io').listen(8080);
  SolarSystem = require("../lib/redisify")({redis:redisClient, model:SolarSystem})

  listeners= {}
  publishers={}
  
  publishers  = socketsio.of("/publish")
  subscribers = socketsio.of('/subscribers')

  subscribers.on "connection", (socket)->
    
    socket.on "startListening", (data)->
      if(SolarSystem.redisFimd(data.solarsystem_id))
        listeners[data.solarsystem_id].push socket
      else
        socket.emit "no such solar system"
    
    socket.on "disconnect", ->
      listeners.splice listeners.indexOf(socket,1)

  publishers.on "connection", (socket)->
    
    socket.on 'takeControll', (data)->
      if publishers[data.solarsystem_id].length==0
        currentSolarSystem  = SolarSyestem.redisFind(data.solarsystem_id)
        if currentSolarSystem  
          socket.emit('you are now in controll!')
        else
          socket.emit('no suck solar system')
      else
        socket.emit('someone else is currnetly in charge of this solar system')

    socket.on 'update', (data)->
      for listener in listeners[currentSolarSystem.id]
        listener.emit "update", data
    
    socket.on 'disconnect', ->
      publishers[currentSolarSystem.id]=null
      socket.emit('goodbye')