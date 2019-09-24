# This is just an example to get you started. Users of your library will
# import this file by writing ``import allographer/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

import db_sqlite, db_mysql, db_postgres, json
from strformat import `&`



proc insert*(queryArg: JsonNode, items: JsonNode, db: proc) =
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

  queryString.add(&"INSERT INTO {table}")
  queryString.add(&" ({columns}) VALUES ({values})")
  echo queryString

  db().exec(sql queryString)
  db().close()


proc insert*(queryArg: JsonNode, rows: openArray, db: proc) =
  var query = queryArg
  let table = query["table"].getStr()

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

    queryString.add(&"INSERT INTO {table}")
    queryString.add(&" ({columns}) VALUES ({values})")
    echo queryString
    db().exec(sql queryString)
    db().close()
