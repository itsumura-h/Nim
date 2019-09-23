import db_sqlite, db_mysql, db_postgres, json
from strformat import `&`
from strutils import contains


proc select*(queryArgs: JsonNode, columnsArgs: varargs[string]): JsonNode =
  var query = queryArgs

  if columnsArgs.len == 0:
    query["select"] = %["*"]
  else:
    query["select"] = %*columnsArgs
  
  return query


proc where*(queryArgs: JsonNode, column: string, symbol: string, value: string): JsonNode =
  var query = queryArgs

  if query.hasKey("where") == false:
    query["where"] = %*[{
      "column": column,
      "symbol": symbol,
      "value": value
    }]
  else:
    query["where"].add(
      %*{
        "column": column,
        "symbol": symbol,
        "value": value
      }
    )

  return query


proc where*(queryArgs: JsonNode, column: string, symbol: string, value: int): JsonNode =
  var query = queryArgs

  if query.hasKey("where") == false:
    query["where"] = %*[{
      "column": column,
      "symbol": symbol,
      "value": value
    }]
  else:
    query["where"].add(
      %*{
        "column": column,
        "symbol": symbol,
        "value": value
      }
    )

  return query


proc orWhere*(queryArgs: JsonNode, column: string, symbol: string, value: string): JsonNode =
  var query = queryArgs

  if query.hasKey("or_where") == false:
    query["or_where"] = %*[{
      "column": column,
      "symbol": symbol,
      "value": value
    }]
  else:
    query["or_where"].add(
      %*{
        "column": column,
        "symbol": symbol,
        "value": value
      }
    )

  return query


proc orWhere*(queryArgs: JsonNode, column: string, symbol: string, value: int): JsonNode =
  var query = queryArgs

  if query.hasKey("or_where") == false:
    query["or_where"] = %*[{
      "column": column,
      "symbol": symbol,
      "value": value
    }]
  else:
    query["or_where"].add(
      %*{
        "column": column,
        "symbol": symbol,
        "value": value
      }
    )

  return query

proc join*(queryArgs: JsonNode,
            table: string, 
            column1: string, 
            symbol: string, 
            column2: string): JsonNode =
  var query = queryArgs

  if query.hasKey("join") == false:
    query["join"] = %*[{
      "table": table,
      "column1": column1,
      "symbol": symbol,
      "column2": column2
    }]
  else:
    query["join"].add(
      %*{
        "table": table,
        "column1": column1,
        "symbol": symbol,
        "column2": column2
      }
    )

  return query


proc offset*(queryArgs: JsonNode, num: int): JsonNode =
  var query = queryArgs
  query["offset"] = %num
  return query


proc limit*(queryArgs: JsonNode, num: int): JsonNode =
  var query = queryArgs
  query["limit"] = %num
  return query


# ======================================================================
# Generate SQL
# ======================================================================

proc generateSelectSQL(queryArgs: JsonNode): string =
  var query = queryArgs
  var queryString = ""

  queryString.add("SELECT")

  # ========== select ==========
  if query.hasKey("select"):
    for i, item in query["select"].getElems():
      if i > 0:
        queryString.add(",")

      queryString.add(&" {item.getStr()}")
  else:
    queryString.add(&" *")

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

  # ========== limit ==========
  if query.hasKey("limit"):
    var num = query["limit"].getInt()
    queryString.add(&" LIMIT {num}")

  # ========== offset ==========
  if query.hasKey("offset"):
    var num = query["offset"].getInt()
    queryString.add(&" OFFSET {num}")

  return queryString

proc getSqlCheck*(queryArgs: JsonNode) =
  var queryString = generateSelectSQL(queryArgs)
  echo queryString


proc get*(queryArgs: JsonNode, db: proc): seq =
  var queryString = generateSelectSQL(queryArgs)

  try:
    echo queryString
    var queryResult = db().getAllRows(sql queryString)
    result = queryResult
  except:
    result = @[]

  db().close()

proc first*(queryArgs: JsonNode, db: proc): seq =
  var queryString = generateSelectSQL(queryArgs)

  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[]

  db().close()

proc find*(queryArgs: JsonNode, id: int, db: proc): seq =
  let query = queryArgs

  var table = query["table"].getStr()

  # ========== select ==========
  var select = ""
  if query.hasKey("select") == false:
    select = " *"
  else:
    for i, item in query["select"].getElems():
      if i > 0:
        select.add(",")

      select.add(&" {item.getStr()}")

  let queryString = &"SELECT{select} FROM {table} WHERE id = {$id}"

  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[""]
  
  db().close()
