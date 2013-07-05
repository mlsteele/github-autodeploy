log = -> console.log.apply console, arguments
plantTimeout  = (ms, cb) -> setTimeout  cb, ms
plantInterval = (ms, cb) -> setInterval cb, ms

http = require 'http'
spawn = (require 'child_process').spawn

requestListener = (req, res) ->
  res.writeHead 200
  res.end 'Bppprp!\n'

server = http.createServer requestListener
server.listen 8413
