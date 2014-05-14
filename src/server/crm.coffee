express = require 'express'
logfmt  = require 'logfmt'
path    = require 'path'

app     = express()

app.use logfmt.requestLogger()
app.use express.static(path.join(__dirname, '../client'))

#app.get '/', (req, res) ->
#    res.send 'test'

port = Number process.env.PORT or 5000

app.listen port, -> 
    console.log 'Listening on ' + port
