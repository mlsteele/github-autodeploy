http = require 'http'
spawn = (require 'child_process').spawn

pull = (repo_path) ->
    git = spawn "git", ['pull'],
      cwd: repo_path
      env: process.env

    git.stdout.on 'data', (data) ->
      console.log "subprocess.stdout: #{msg}" for msg in data.toString().split '\n'

    git.stderr.on 'data', (data) ->
      console.log "subprocess.stderr: #{msg}" for msg in data.toString().split '\n'

    git.on 'close', (code) ->
      console.log "subprocess.exited: code #{code}"


config = require './config.json'

server = http.createServer (req, res) ->
  pull config.repo_path
  res.writeHead 200
  res.end 'Ok.\n'

server.listen 8413
