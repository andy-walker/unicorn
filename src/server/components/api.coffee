fs   = require 'fs'
path = require 'path'

module.exports = 
    
    class API

        api: {}
        
        constructor: -> 
            
            console.log 'Initializing API ...'

            # require each file in ../api and instantiate contained class
            dir = path.join(__dirname, '../api')
            for file in fs.readdirSync dir
                name       = file.split('.')[0]
                @api[name] = new (require path.join(dir, file))

        execute: (request) -> 
            
            return status: 'contact' if request.entity is 'contact'
            return status: 'notok'

