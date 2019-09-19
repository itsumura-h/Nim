include jester

template jsonResponse*(response: JsonNode) =
  try:
    resp response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, e

template jsonResponse*(response: JsonNode, argHeaders: openArray[tuple[key, value: string]]) =
  var newHeaders = argHeaders
  newHeaders.add(("Content-Type", "application/json"))
  try:
    resp Http200, newHeaders, $response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, newHeaders, e

template stringResponse*(response: string) =
  try:
    resp response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, e

template stringResponse*(response: string, headers: openArray[tuple[key, value: string]]) =
  try:
    resp Http200, headers, response
  except:
    let e = getCurrentExceptionMsg()
    resp Http500, headers, e