log = -> console.log.apply console, arguments
plantTimeout  = (ms, cb) -> setTimeout  cb, ms
plantInterval = (ms, cb) -> setInterval cb, ms

spawn = (require 'child_process').spawn
config = require './config.json'

git = spawn "git", ['pull'],
  cwd: config.repo_root,
  env: process.env

git.stdout.on 'data', (data) ->
  log "subprocess.stdout: #{msg}" for msg in data.toString().split '\n'

git.stderr.on 'data', (data) ->
  log "subprocess.stderr: #{msg}" for msg in data.toString().split '\n'

git.on 'close', (code) ->
  log "subprocess.exited: code #{code}"
