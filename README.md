# Swifty Server

## Swift Package Manager

* Swift is a programing language.
* Package of code, could be a library or framework. Code that you wouldn't execute by itself.
* Helps us use swift packages in our swift projects.
* Swift package manager command line tool, helps us to build swift apps.

### Creating a swift package

* Create a new empty directory with the Project's name.
* Run `swift package init --options`
* Run `swift package generate-xcodeproj` to generate an xcode project.

## HTTP Servers

* A computer that you can communicate with using HTTP
* Could serve or receive data, or do other things. 
* Allows for the possibility of sharing data. 
* Servers: A computer, a piece of hardware. A VM virtual piece of hardware. Software that actually handles the HTTP communication. 

* A lot of linux type os, mac os, windows server.
* Servers OS, don't usually have a gui.
* Communication with a "server" is usually done through the command line. `ssh`

## Swift Server

* Using the swift package manager, we can setup server software on _any_ piece of hardware that supports swift.

* Vapor toolbox

* Vapor


## Heroku

* Create a heroku account
* Install the heroku cli
* login to heroku through the cli
* commit all your code to git
* run  `vapor heroku init`
* `vapor heroku push` to push any updates

## Links

* [Installing Vapor Toolbox](https://docs.vapor.codes/2.0/getting-started/toolbox/)
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
* [Ray Wenderlich](https://videos.raywenderlich.com/screencasts/509-server-side-swift-with-vapor-getting-started)

## Snippets

```
### Vapor ###
Config/secrets

### Vapor Patch ###
Packages
.build
xcuserdata
*.xcodeproj
DerivedData/
.DS_Store
```

```
.package(url: "https://github.com/vapor/vapor.git", from: "2.4.4"),
 dependencies: ["Vapor"]),
```

```
drop.post("something") { request in
  guard let thing = request.json?["thing"]?.string else {
    return Response(status: .imATeapot)
  }
  var json = JSON()
  try json.set("Thing", thing)
  let response = try Response(status: .ok, json: json)
  response.headers["Content-Type"] = "application/json"
  return response
}
```

"Content-Type: application/json"

```
curl localhost:8080/cities --header "Accept: application/json" --header "Content-type: application/json" --verbose
```