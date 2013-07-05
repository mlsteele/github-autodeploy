http = require 'http'
spawn = (require 'child_process').spawn

pull = (repo_path) ->
    git = spawn "git", ['pull'],
      cwd: repo_path
      env: process.env

    console.log "(#{git.pid}) spawned 'git pull' with that PID"
    console.log "(#{git.pid}) in '#{repo_path}'"

    git.stdout.on 'data', (data) ->
      console.log "(#{git.pid}) stdout: #{msg}" for msg in data.toString().split '\n'

    git.stderr.on 'data', (data) ->
      console.log "(#{git.pid}) stderr: #{msg}" for msg in data.toString().split '\n'

    git.on 'close', (code) ->
      console.log "(#{git.pid}) exited with code #{code}"


config = require './config.json'

server = http.createServer (req, res) ->
  pull repo_path for repo_path in config.repos_paths
  res.writeHead 200
  res.end 'Ok.\n'

server.listen 8413
