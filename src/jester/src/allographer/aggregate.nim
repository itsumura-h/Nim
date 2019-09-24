import db_sqlite, db_mysql, db_postgres, json
from strutils import contains, parseInt
import sqlBuilder



proc generateCountSql(queryArg: JsonNode): string =
  return selectCountSql(queryArg)
          .fromSql(queryArg)
          .joinSql(queryArg)
          .whereSql(queryArg)
          .orWhereSql(queryArg)
          .limitSql(queryArg)
          .offsetSql(queryArg)


proc count*(queryArg: JsonNode, db: proc): int =
  var queryString = generateCountSql(queryArg)

  try:
    echo queryString
    result = db().getValue(sql queryString).parseInt()
  except:
    result = 0

  db().close()

proc countColumns*(queryArg: JsonNode, db: proc): seq =
  var queryString = generateCountSql(queryArg)

  try:
    echo queryString
    result = db().getRow(sql queryString)
  except:
    result = @[""]

  db().close()