import json
from strformat import `&`
from strutils import contains



proc selectSql*(queryArg: JsonNode): string =
  var query = queryArg
  var queryString = ""

  queryString.add("SELECT")

  if query.hasKey("select"):
    for i, item in query["select"].getElems():
      if i > 0:
        queryString.add(",")

      queryString.add(&" {item.getStr()}")
  else:
    queryString.add(" *")

  return queryString


proc selectCountSql*(queryArg: JsonNode): string =
  var query = queryArg
  var queryString = ""

  queryString.add("SELECT")

  if query.hasKey("select"):
    for i, item in query["select"].getElems():
      if i > 0:
        queryString.add(",")

      queryString.add(&" COUNT({item.getStr()})")
  else:
    queryString.add(&" COUNT(*)")

  return queryString


proc deleteSql*(): string =
  var queryString = "DELETE"
  return queryString


proc fromSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  var table = query["table"].getStr()
  queryString.add(&" FROM {table}")

  return queryString


proc joinSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  if query.hasKey("join"):
    for row in query["join"]:
      var table = row["table"].getStr()
      var column1 = row["column1"].getStr()
      var symbol = row["symbol"].getStr()
      var column2 = row["column2"].getStr()

      queryString.add(&" JOIN {table} ON {column1} {symbol} {column2}")

  return queryString


proc whereSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  if query.hasKey("where"):
    for i, row in query["where"].getElems():
      var column = row["column"].getStr()
      var symbol = row["symbol"].getStr()
      var value = row["value"]
      
      if i == 0:
        queryString.add(&" WHERE {column} {symbol} {value}")
      else:
        queryString.add(&" AND {column} {symbol} {value}")

  return queryString


proc orWhereSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  if query.hasKey("or_where"):
    for row in query["or_where"]:
      var column = row["column"].getStr()
      var symbol = row["symbol"].getStr()
      var value = row["value"]
      
      if queryString.contains("WHERE"):
        queryString.add(&" OR {column} {symbol} {value}")
      else:
        queryString.add(&" WHERE {column} {symbol} {value}")

  return queryString


proc limitSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  if query.hasKey("limit"):
    var num = query["limit"].getInt()
    queryString.add(&" LIMIT {num}")

  return queryString


proc offsetSql*(queryStringArg: string, queryArg: JsonNode): string =
  var query = queryArg
  var queryString = queryStringArg

  if query.hasKey("offset"):
    var num = query["offset"].getInt()
    queryString.add(&" OFFSET {num}")

  return queryString
