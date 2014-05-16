
# application entry point

# add components in the order you want them to start in
# bootstrap should always come first

unicorn =  

    bootstrap: new ( require './components/bootstrap' )
    config:    new ( require './components/config'    )
    db:        new ( require './components/db'        )
    persist:   new ( require './components/persist'   )
    module:    new ( require './components/module'    )
    api:       new ( require './components/api'       )
    webserver: new ( require './components/webserver' )

