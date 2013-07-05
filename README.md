GitHub Auto-Deploy
-----------------------

A tool for easily deploying projects to remote servers.
Run the autodeploy server to listen for git service hooks

## Configuration

## config.json
Edit config.json to point to the repositories you want to be pulled when the hook fires.

If you want to change what port the autodeploy server listens on, change the port entry in config.json

Run

    $ coffee autodeploy.coffee
to start the autodeploy server.

## GitHub
Add a GitHub service hook to point to your server on the port specified in config.json.

That's it!
Push to your repository and watch your server's repositories update themselves.
