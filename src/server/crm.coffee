express    = require 'express'
logfmt     = require 'logfmt'
path       = require 'path'
bodyParser = require 'body-parser'
pg         = require 'pg'

# add components in the order you want them to start in
# bootstrap should always come first
unicorn =  

    bootstrap: new ( require './components/bootstrap' )
    config:    new ( require './components/config'    )
    db:        new ( require './components/db'        )
    module:    new ( require './components/module'    )
    api:       new ( require './components/api'       )
    webserver: new ( require './components/webserver' )

app = express() 

app.use logfmt.requestLogger()
app.use bodyParser()
app.use express.static(path.join(__dirname, '../client'))

# api
app.post '/', (req, res) ->
    console.log req.body

port = Number process.env.PORT or 5000

app.listen port, -> 
    console.log 'Listening on ' + port
