console.log("setting up redis")
redis  = require('redis')
client =redis.createClient()

client.on 'error', (error)->
  console.log "REDIS ERRPR #{error}"


exports.client = client