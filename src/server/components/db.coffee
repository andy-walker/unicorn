pg = require 'pg'

module.exports = 
    
    class DB
        
        constructor: ->
            
            console.log 'Initializing database connection ...'
