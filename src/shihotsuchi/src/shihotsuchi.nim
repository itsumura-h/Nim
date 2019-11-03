# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strformat
include jester

type HttpMethod* = enum
  get = "get"
  post = "post"
  put = "put"
  delete = "delete"


macro genPath(body: untyped) =
  echo treeRepr body
  var node = newNimNode(nnkStmtList)

    # let httpMethod = path[1]
    # let uri = path[2]
    # let body = path[3][0]

  # return nnkCommand.newTree([
  #   newIdentNode($httpMethod),
  #   newLit(uri),
  #   nnkStmtList.newTree(
  #     nnkCommand.newTree(
  #       newIdentNode("resp"),
  #       nnkCall.newTree(
  #         newIdentNode(body)
  #       )
  #     )
  #   )
  # ])

proc path*(httpMethod:HttpMethod, uri:string, body:string):NimNode =
  return genPath: [httpMethod, uri, body]

macro routings*(body: untyped) =
  # var node = newNimNode(nnkStmtList)
  # for path in body:
  #   let httpMethod = path[1]
  #   let uri = path[2]
  #   let body = path[3][0]

  #   node.add(
  #     nnkCommand.newTree([
  #       newIdentNode($httpMethod),
  #       newLit($uri),
  #       nnkStmtList.newTree(
  #         nnkCommand.newTree(
  #           newIdentNode("resp"),
  #           nnkCall.newTree(
  #             newIdentNode($body)
  #           )
  #         )
  #       )
  #     ])
  #   )

  # echo treeRepr body
  result = routesEx("match", body)

  let jesIdent = genSym(nskVar, "jes")
  let matchIdent = newIdentNode("match")
  let errorHandlerIdent = newIdentNode("matchErrorHandler")
  let settingsIdent = newIdentNode("settings")
  result.add(
    quote do:
      var `jesIdent` = initJester(`matchIdent`, `settingsIdent`)
      `jesIdent`.register(`errorHandlerIdent`)
  )
  result.add(
    quote do:
      serve(`jesIdent`)
  )

macro routeGroups*(name: untyped, body: untyped) =
  if name.kind != nnkIdent:
    error("Need an ident.", name)

  routesEx($name.ident, body)