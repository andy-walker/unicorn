express    = require 'express'
logfmt     = require 'logfmt'
path       = require 'path'
bodyParser = require 'body-parser'

module.exports = 
    
    class Webserver
        
        constructor: ->
            
            console.log 'Starting webserver ...'

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