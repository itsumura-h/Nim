import jester, asyncdispatch, httpcore, strutils, re, json, sugar, tables
from middleware import middleware
from controllers/SampleController import SampleController
from controllers/ManageUsersController import ManageUsersController


routes:
  options re".*":
    resp Http200, middleware.setNewHeaders(request), ""
  # Sample
  get "/sample/":
    resp Http200, middleware.setNewHeaders(request), SampleController.index()
  get "/sample/fib/@num/":
    resp SampleController.fib(@"num")
  
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