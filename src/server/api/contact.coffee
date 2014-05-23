module.exports = 

	class ContactAPI

		constructor: ->
			console.log 'test constructor'

		delete: (request) ->

		load: (request) ->
			return status: 'ok'

		save: (request) ->

		validate: (request) ->
			# return yes # for now
			return status: 'error', error: 'This is a test error'
