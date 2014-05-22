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
            
            entity = request.entity
            method = request.method

            if @api[entity] is undefined
                
                return {
                    status:        "error"
                    error_message: "API '#{entity}' not implemented."
                }

            if typeof @api[entity][method] isnt 'function'
                
                return {
                    status:        "error"
                    error_message: "API '#{entity}' does not implement method: '#{method}'"
                }

            return status: 'contact' if request.entity is 'contact'
            return status: 'notok'

