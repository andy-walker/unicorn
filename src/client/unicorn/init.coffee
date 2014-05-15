(()->
    
    # initialize require paths
    requirejs.config
        
        baseUrl: 'libraries'
        paths:
            unicorn: '/unicorn'

    requirejs(
        ['jquery', 'underscore', 'backbone', 'unicorn/auth'],
        ($, _, Backbone, Auth) ->
            $ 'body'
                .html 'modules loaded'

            new Auth                                                              
    )
    
).call @