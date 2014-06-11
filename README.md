# GitHub Auto-Deploy

A tool for easily deploying projects to remote servers.
Run the autodeploy server to listen for git service hooks
and pull on a remote server when changes happen.

## Setup

### config.json
Copy the example configuration file:
```
cp config.example.json
```

Edit `config.json` to point to the repositories you want to be pulled when the hook fires.
You can specify more than one repo path. When _any_ of the repos fires a service hook
then this will update _all_ of the repos listed.

Here's an example `config.json`
```javascript
{
  "port": 8413,
  "repos_paths": [
    "/Users/miles/code/goober",
    "/Users/miles/code/asteroids"
  ]
}
```

If you want to change what port the autodeploy server listens on, change the port entry in config.json

### Service
To start the autodeploy server run:
```
coffee autodeploy.coffee
```

### GitHub Hook
Add a GitHub service hook to point to your server on the port specified in config.json.

That's it!
Push to your repository and watch your server's repositories update themselves.
