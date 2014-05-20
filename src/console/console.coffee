#
# app/console - this is just a test utility for the api at the moment
#

args = []
opts = {}

try
    global.config = require './config.json'
catch e
    console.log "Error reading config.json"
    process.exit 1

# iterate over command-line arguments
process.argv.slice(2).forEach (value) ->
    
    # attempt to split item on '=', if length is 2, treat as option
    splitValue = value.split '='
    
    if splitValue.length > 1 
        if splitValue[0].indexOf '--' is 0
            option       = splitValue[0].substr(2)
            opts[option] = splitValue[1]

    # otherwise, item is an argument
    else args.push(value) 

# 
commandName = args.shift()

if commandName is undefined
    console.log "Please specifiy a command (eg: 'api') as the first argument"
    process.exit 1

try
    command = require "./.console/#{commandName}"
catch e
    console.log "Not a valid command: '#{commandName}' - type 'app/console help' for help"
    process.exit 1

(new command(args, opts))
    .execute()


