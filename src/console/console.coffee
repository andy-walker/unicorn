#
# app/console - this is just a test utility for the api at the moment
#

try
    config = require './config.json'
catch error
    console.log "Error reading config.json"
    process.exit 1

http  = require 'http'
query = []

process.argv.forEach (val, index) ->
    query.push val if index > 1

postObject =
    query: query.join ' '

postString = JSON.stringify postObject

headers =
    'Content-Type':  'application/json',
    'Content-Length': postString.length

options = 
    host:    config.host,
    port:    config.port,
    path:    '/',
    method:  'POST',
    headers: headers

req = http.request options, (res) ->
    res.on 'data', (chunk) ->
       console.log '' + chunk

req.write postString
req.end()


