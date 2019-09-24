import db_sqlite, db_mysql, db_postgres, json
from strutils import contains, parseInt
from strformat import `&`

proc generateCountSQL(queryArgs: JsonNode): string =
  var query = queryArgs
  var queryString = ""

  queryString.add("SELECT")

  # ========== select ==========
  if query.hasKey("select"):
    for i, item in query["select"].getElems():
      if i > 0:
        queryString.add(",")

      queryString.add(&" COUNT({item.getStr()})")
  else:
    queryString.add(&" COUNT(*)")

  # ========== from ==========
  var table = query["table"].getStr()
  queryString.add(&" FROM {table}")

  # ========== join ==========
  if query.hasKey("join"):
    for row in query["join"]:
      var table = row["table"].getStr()
      var column1 = row["column1"].getStr()
      var symbol = row["symbol"].getStr()
      var column2 = row["column2"].getStr()

      queryString.add(&" JOIN {table} ON {column1} {symbol} {column2}")

  # ========== where ==========
  if query.hasKey("where"):
    for i, row in query["where"].getElems():
      var column = row["column"].getStr()
      var symbol = row["symbol"].getStr()
      var value = row["value"]

      if i == 0:
        queryString.add(&" WHERE {column} {symbol} {value}")
      else:
        queryString.add(&" AND {column} {symbol} {value}")

  # ========== or where ==========
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

proc count*(queryArgs: JsonNode, db: proc): int =
  var queryString = generateCountSQL(queryArgs)
  try:
    echo queryString
    result = db().getValue(sql queryString).parseInt()
  except:
    result = 0

proc countColumns*(queryArgs: JsonNode, db: proc): seq =
  var queryString = generateCountSQL(queryArgs)
  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[""]
