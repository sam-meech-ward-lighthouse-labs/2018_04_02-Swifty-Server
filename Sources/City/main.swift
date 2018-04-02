import Vapor
import Foundation

let drop = try Droplet()

var database: [String: String] = [:]

drop.get("hello") { req in
  return "Hello Vapor"
}

drop.get("theme") { request in
  return "blue"
}

drop.get("random", "cool", "sunny") { request in
  var json = JSON()
  try json.set("city", "Vancouver")
  let response = try Response(status: .ok, json: json)
  response.headers["Content-Type"] = "application/json"
  return response
}

drop.get("population", Int.parameter, "temperature", String.parameter) { request in
  
  let population = try request.parameters.next(Int.self)
  let temperature = try request.parameters.next(String.self)
  
  let jazzHands = String(repeating: "🤗", count: population)
  
  var json = JSON()
  try json.set("city", "Vancouver")
  try json.set("temperature", temperature)
  try json.set("population", jazzHands)
  
  let response = try Response(status: .ok, json: json)
  response.headers["Content-Type"] = "application/json"
  return response
}

drop.post("cities") { request in
  guard let name = request.json?["name"]?.string else {
    return Response(status: .imATeapot)
  }
  
  database[UUID().uuidString] = name
  
  return Response(status: .ok)
}

drop.get("cities") { request in
  let json = try JSON(node: database)
  
  let response = try Response(status: .ok, json: json)
  response.headers["Content-Type"] = "application/json"
  return response
}

drop.get { request in
  return try drop.view.make("index.html")
}

try drop.run()
