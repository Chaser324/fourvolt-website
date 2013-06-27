
express = require('express')
http = require('http')
path = require('path')
email = require('./routes/email')

app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'underscore'
app.use express.favicon()
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static path.join __dirname, 'public'

app.post '/message', email.sendMessage

http.createServer(app).listen app.get('port'), ->
    console.log 'Express server listening on port ' + app.get('port')
