# app/console module for querying the api

http = require 'http'

module.exports = 

    class APIQuery

        constructor: (@args, @opts) ->

        execute: ->

            post = 
                method: @args.shift()
                entity: @args.shift()

            if post.entity is undefined or post.method is undefined
                console.log "Usage: app/console api <method> <entity>"
                return 0

            for option, value of @opts
                post[option] = value

            post = JSON.stringify post

            reqParams = 
                host:    config.host,
                port:    config.port,
                path:    '/',
                method:  'POST',
                headers:
                    'Content-Type':  'application/json',
                    'Content-Length': post.length

            req = http.request reqParams, (response) ->
                response.on 'data', (chunk) ->
                   console.log '' + chunk

            req.write post
            req.end()

