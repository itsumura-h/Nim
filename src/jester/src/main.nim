import busker, asyncdispatch, httpcore, strutils, re, json, sugar, tables
from conf/middlewares import middleware
from conf/customHeaders import corsHeader
from controllers/SampleController import SampleController
from controllers/ManageUsersController import ManageUsersController

router manageUsers:
  get "":
    stringResponse(ManageUsersController.index())
  get "/create":
    stringResponse(ManageUsersController.create())
  post "":
    stringResponse(ManageUsersController.store(request))
  get "/@id":
    stringResponse(ManageUsersController.show(@"id"))
  put "/@id":
    jsonResponse(ManageUsersController.update(@"id"))

router sample:
  get "":
    middleware(request); stringResponse(SampleController.index(), corsHeader(request))
  get "/fib/@num":
    middleware(request); jsonResponse(SampleController.fib(@"num"), corsHeader(request))


routes:
  options re".*":
    stringResponse("", corsHeader(request))
  # Sample
  extend sample, "/sample"
  
  # ManageUsers
  extend manageUsers, "/ManageUsers"



runForever()

# proc main() =
#   let port = 8000.Port
#   let settings = newSettings(port=port)
#   # var jester = initJester(main_router, settings=settings)
#   var jester = initJester(settings=settings)
#   jester.serve()

# when isMainModule:
#   main()