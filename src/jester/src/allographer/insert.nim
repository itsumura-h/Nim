import db_sqlite, db_mysql, db_postgres, json
from strformat import `&`

proc insert*(queryArgs: JsonNode, items: JsonNode, db: proc) =
  var query = queryArgs
  var queryString = ""
  let table = query["table"].getStr()
  var columns = ""
  var values = ""

  queryString.add(&"INSERT INTO {table}")

  var i = 0
  for item in items.pairs:
    if i > 0:
      columns.add(",")
      values.add(",")
    i += 1
    columns.add(&"{item.key}")
    values.add(&"{item.val}")

  queryString.add(&" ({columns}) VALUES ({values})")
  echo queryString