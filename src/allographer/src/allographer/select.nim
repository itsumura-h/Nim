# This is just an example to get you started. Users of your library will
# import this file by writing ``import allographer/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

import db_sqlite, db_mysql, db_postgres, json
from strformat import `&`
import sqlBuilder



proc select*(queryArg: JsonNode, columnsArg: varargs[string]): JsonNode =
  var query = queryArg

  if columnsArg.len == 0:
    query["select"] = %["*"]
  else:
    query["select"] = %*columnsArg
  
  return query


proc where*(queryArg: JsonNode, column: string, symbol: string, value: string): JsonNode =
  var query = queryArg

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


proc where*(queryArg: JsonNode, column: string, symbol: string, value: int): JsonNode =
  var query = queryArg

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


proc orWhere*(queryArg: JsonNode, column: string, symbol: string, value: string): JsonNode =
  var query = queryArg

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


proc orWhere*(queryArg: JsonNode, column: string, symbol: string, value: int): JsonNode =
  var query = queryArg

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


proc join*(queryArg: JsonNode,
            table: string, 
            column1: string, 
            symbol: string, 
            column2: string): JsonNode =
  var query = queryArg

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


proc offset*(queryArg: JsonNode, num: int): JsonNode =
  var query = queryArg
  query["offset"] = %num
  return query


proc limit*(queryArg: JsonNode, num: int): JsonNode =
  var query = queryArg
  query["limit"] = %num
  return query


# ======================================================================
# Generate SQL
# ======================================================================

proc generateSelectSql(queryArg: JsonNode): string =
  return selectSql(queryArg)
        .fromSql(queryArg)
        .joinSql(queryArg)
        .whereSql(queryArg)
        .orWhereSql(queryArg)
        .limitSql(queryArg)
        .offsetSql(queryArg)


proc getSqlCheck*(queryArg: JsonNode) =
  echo generateSelectSql(queryArg)


proc get*(queryArg: JsonNode, db: proc): seq =
  let queryString = generateSelectSql(queryArg)

  try:
    echo queryString
    var queryResult = db().getAllRows(sql queryString)
    result = queryResult
  except:
    result = @[]

  db().close()


proc first*(queryArg: JsonNode, db: proc): seq =
  let queryString = generateSelectSql(queryArg)

  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[]

  db().close()


proc find*(queryArg: JsonNode, id: int, db: proc): seq =
  var queryString = selectSql(queryArg)
                    .fromSql(queryArg)

  queryString.add(&" WHERE id = {$id}")

  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[""]
  
  db().close()
