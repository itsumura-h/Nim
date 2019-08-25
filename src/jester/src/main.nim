import jester, asyncdispatch, httpcore, strutils, re, json
from controllers/SampleController import SampleController
from controllers/ManageUsersController import ManageUsersController

# proc setHeaders(request: Request, headers: StringTableRef) =
proc setHeaders(request: Request, headers: HttpHeaders) =
  headers["Cache-Control"] = "no-cache"
  headers["Access-Control-Allow-Origin"] = "*"
  headers["Access-Control-Allow-Methods"] = "OPTIONS, GET, POST, DELETE, PATCH"
  let values: HttpHeaderValues = request.headers.getOrDefault("Access-Control-Request-Headers")
  headers["Access-Control-Allow-Headers"] = join(seq[string](values), ", ")


# router main_router:
routes:
  # Sample
  get "/sample/":
    resp SampleController.index()
  get "/sample/fib/@num/":
    resp SampleController.fib(@"num"), "application/json"
  
  # ManageUsers
  options re"ManageUsers":
    request.setHeaders(request.headers); resp ""
  get "/ManageUsers/":
    resp ManageUsersController.index()
  get "/ManageUsers/create/":
    resp ManageUsersController.create()
  get "/ManageUsers/@id/":
    resp ManageUsersController.show()
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