express = require 'express'

app = express()

app.set 'view engine', 'jade'

# set up connect-assets
app.use require('connect-assets')(src: __dirname + '/src')
# we want to handle full paths
js.root = css.root = img.root = ''
# app.use express.static __dirname + '/public'

app.get '/', (req, res) ->
  res.render 'index'

app.get '/partial/:partial', (req, res) ->
  res.render "partial/#{req.params.partial}"

app.configure 'development', ->
  app.use express.errorHandler()
  app.locals.pretty = true

port = process.env.PORT || 8000;
app.listen port, ->
  console.log "Listening on #{port}"