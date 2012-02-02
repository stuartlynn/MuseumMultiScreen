console.log("setting up redis")
redis  = require('redis')
client =redis.createClient()

client.on 'error', (error)->
  console.log error


exports.client = client