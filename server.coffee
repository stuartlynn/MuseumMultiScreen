express = require('express')
Resource = require('express-resource')


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


# Rest Api endpoints for solar systems 
console.log "setting up web server"

app.resource 'solarsystems', require('./controllers/SolarSystemController')(redisClient)
app.listen(3000)

# Set up websockets 
console.log "setting up webscokets"
require("./controllers/SolarSystemLiveController")(redisClient)

console.log "server started on 3000"
