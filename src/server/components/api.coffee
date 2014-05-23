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

            # validate entity
            if @api[entity] is undefined
                
                return {
                    status: "error"
                    error:  "API '#{entity}' not implemented."
                }

            # validate method
            if typeof @api[entity][method] isnt 'function'
                
                return {
                    status: "error"
                    error:  "API '#{entity}' does not implement method: '#{method}'"
                }

            
            if (result = @api[entity].validate request) is yes
                return @api[entity][method](request)
            else
                result.status = "error"
                return result

