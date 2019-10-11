import asyncdispatch, httpcore, strutils, re, json, sugar, tables
import ../busker/busker
from config/middlewares import middleware
from config/customHeaders import corsHeader
import controllers/ToppageController
import controllers/SampleController
import controllers/ManageUsersController


router toppage:
  get "react/":
    HTTPResponse(ToppageController().react())
  get "vue/":
    HTTPResponse(ToppageController().vue())

router manageUsers:
  get "":
    HTTPResponse(ManageUsersController.index())
  get "create/":
    HTTPResponse(ManageUsersController.create())
  post "":
    HTTPResponse(ManageUsersController.store(request))
  get "@id/":
    HTTPResponse(ManageUsersController.show(@"id"))
  put "@id/":
    jsonResponse(ManageUsersController.update(@"id"))

router sample:
  get "":
    middleware(request); HTTPResponse(SampleController.index(), corsHeader(request))
  get "fib/@num/":
    middleware(request); jsonResponse(SampleController.fib(@"num"), corsHeader(request))


routes:
  options re".*":
    HTTPResponse("", corsHeader(request))
  
  # Toppage
  get "/":
    HTTPResponse(ToppageController().index())
  extend toppage, "/toppage/"

  # Sample
  extend sample, "/sample/"
  
  # ManageUsers
  extend manageUsers, "/ManageUsers/"



runForever()

# proc main() =
#   let port = 8000.Port
#   let settings = newSettings(port=port)
#   # var jester = initJester(main_router, settings=settings)
#   var jester = initJester(settings=settings)
#   jester.serve()

# when isMainModule:
#   main()