import db_sqlite, json, strformat

proc table*(table: string): JsonNode =
  var query = %*{
    "table": table
  }
  return query

proc select*(querayArgs: JsonNode, selectArgs: varargs[string]): JsonNode =
  var query = querayArgs

  query["type"] = newJString("select")
  query["select"] = %*selectArgs
  return query

proc get*(querayArgs: JsonNode, db: proc): seq =
  var query = querayArgs
  var queryString = ""

  if query["type"].getStr() == "select":
    queryString &= "SELECT "

    var i = 0
    for item in query["select"]:
      if i != 0:
        queryString &= ","
      i += 1

      queryString &= &"{item.getStr()} "
      

  var table = query["table"].getStr()
  queryString &= &"from {table}"
  
  return db().getAllRows(sql queryString)