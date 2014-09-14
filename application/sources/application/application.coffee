express = require 'express'
application = do express
multiparty = require 'multiparty'
staticFilesServerMiddleware = express.static __dirname + '/../public/'

application.use staticFilesServerMiddleware
application.use (request, response, next) ->
	multipart = new multiparty.Form
	multipart.parse request, (error, fields, files) ->
		request.body = fields
		request.files = files
		do next

application.listen 8080

