import db_sqlite, db_mysql, db_postgres, json
from strformat import `&`



proc insert*(queryArg: JsonNode, items: JsonNode): string =
  var query = queryArg
  var queryString = ""
  let table = query["table"].getStr()
  var columns = ""
  var values = ""

  var i = 0
  for item in items.pairs:
    if i > 0:
      columns.add(", ")
      values.add(", ")
    i += 1
    columns.add(&"{item.key}")
    values.add(&"{item.val}")

  queryString.add(&"INSERT INTO {table} ({columns}) VALUES ({values})")
  return queryString


proc insert*(queryArg: JsonNode, rows: openArray[JsonNode]): string =
  let table = queryArg["table"].getStr()

  var columns = ""
  var rowsCount = 0
  for key, value in rows[0]:
    if rowsCount > 0:
      columns.add(", ")
    rowsCount += 1
    columns.add(&"{key}")

  var values = ""
  var valuesCount = 0
  for items in rows:
    var valueCount = 0
    var value = ""
    for item in items.pairs:
      if valueCount > 0:
        value.add(", ")
      valueCount += 1
      value.add(&"{item.val}")

    if valuesCount > 0:
      values.add(", ")
    valuesCount += 1

    values.add(&"({value})")

  return &"INSERT INTO {table} ({columns}) VALUES {values}"


proc insertDifferentColumns*(queryArg: JsonNode, rows: openArray[JsonNode]): seq =
  let table = queryArg["table"].getStr()
  var sqls = @[""]

  for items in rows:
    var queryString = ""
    var columns = ""
    var values = ""

    var itemCount = 0
    for item in items.pairs:
      if itemCount > 0:
        columns.add(", ")
        values.add(", ")
      itemCount += 1
      columns.add(&"{item.key}")
      values.add(&"{item.val}")

    queryString.add(&"INSERT INTO {table} ({columns}) VALUES ({values})")
    sqls.add(queryString)

  sqls.delete(0)
  return sqls
