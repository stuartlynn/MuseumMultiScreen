express = require('express')
app = express.createServer()
app.use(express.bodyParser())
app.use(express.logger())

# setting up Hem manually rather than use the server option
# so we can add things to our express server
Hem = require("hem")
hem = new Hem()
app.get(hem.options.cssPath, hem.cssPackage().createServer())
app.get(hem.options.jsPath, hem.hemPackage().createServer())
app.use(express.static("./public"))

redisClient  = require('./config/redis').client

app.get '/solarsystem/:id', (req,res)->
  redisClient.set 'solarsystem_ids', req.params.id
  res.send('Hello World '+ req.params.id);

app.post '/solarsystem/', (req, res)->
  console.log("creating new solar system")

app.post '/solarsystem/:id', (req,res)->
  comsole.log("updating solar system")

app.get '/solarsystem/', (req,res)->
  redisClient.get 'solarsystem_ids', (err, result)=>
    res.send('the last set was '+result)

app.listen(3000)
console.log "server started on 3000"
