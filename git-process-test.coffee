log = -> console.log.apply console, arguments
plantTimeout  = (ms, cb) -> setTimeout  cb, ms
plantInterval = (ms, cb) -> setInterval cb, ms

spawn = (require 'child_process').spawn

ls = spawn "ls", [],
  cwd: "/",
  env: process.env

ls.stdout.on 'data', (data) ->
  log "stdout: #{data}"

ls.stderr.on 'data', (data) ->
  log "stderr: #{data}"

ls.on 'close', (code) ->
  log "exited on #{code}"
