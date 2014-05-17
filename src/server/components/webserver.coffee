express    = require 'express'
logfmt     = require 'logfmt'
path       = require 'path'
bodyParser = require 'body-parser'

module.exports = 
    
    class Webserver
        
        constructor: ->
            
            console.log 'Starting webserver ...'

            app  = express()
            port = Number process.env.PORT or 5000

            app.use logfmt.requestLogger()
            app.use bodyParser()

            # serve static files from client dir, alias as /
            app.use express.static(path.join(__dirname + '/../', '../client'))

            # process api requests
            app.post '/', (req, res) -> res.send unicorn.api.execute req.body

            app.listen port, -> 
                console.log 'Listening on ' + port