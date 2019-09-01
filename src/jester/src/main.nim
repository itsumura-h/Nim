import jester, asyncdispatch, httpcore, strutils, re, json, sugar
from controllers/SampleController import SampleController
from controllers/ManageUsersController import ManageUsersController


proc setNewHeaders(request: Request): seq =
  var headers = @[
    ("Cache-Control", "no-cache"),
    ("Access-Control-Allow-Origin", "*"),
    ("Access-Control-Allow-Methods", "OPTIONS, GET, POST, DELETE, PATCH")
  ]

  var allowedHeaders = @[
    "X-login-id",
    "X-login-token"
    ]
  if allowedHeaders.len() > 0:
    var strAllowedHeaders = allowedHeaders.join(", ")
    headers.add(("Access-Control-Allow-Headers", strAllowedHeaders))
  return headers

routes:
  options re".*":
    let newHeaders = setNewHeaders(request); resp Http200, newHeaders, ""
  # Sample
  get "/sample/":
    resp SampleController.index()
  get "/sample/fib/@num/":
    resp SampleController.fib(@"num"), "application/json"
  
  # ManageUsers
  get "/ManageUsers/":
    resp ManageUsersController.index()
  get "/ManageUsers/create/":
    resp ManageUsersController.create()
  post "/ManageUsers/":
    resp ManageUsersController.store(request)
  get "/ManageUsers/@id/":
    resp ManageUsersController.show(@"id")
  put "/ManageUsers/@id/":
    resp ManageUsersController.update(@"id"), "application/json"


runForever()

# proc main() =
#   let port = 8000.Port
#   let settings = newSettings(port=port)
#   # var jester = initJester(main_router, settings=settings)
#   var jester = initJester(settings=settings)
#   jester.serve()

# when isMainModule:
#   main()