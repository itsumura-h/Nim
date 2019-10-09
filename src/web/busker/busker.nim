include jester

template jsonResponse*(response: JsonNode) =
  try:
    resp response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, e

template jsonResponse*(response: JsonNode, headersArg: openArray[tuple[key, value: string]]) =
  var headers = headersArg
  headers.add(("Content-Type", "application/json"))
  try:
    resp Http200, headers, $response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, headers, e

template HTTPResponse*(response: string) =
  try:
    resp response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, e

template HTTPResponse*(response: string, headers: openArray[tuple[key, value: string]]) =
  try:
    resp Http200, headers, response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, headers, e