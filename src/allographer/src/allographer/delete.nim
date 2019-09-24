# This is just an example to get you started. Users of your library will
# import this file by writing ``import allographer/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

import db_sqlite, db_mysql, db_postgres, json
import strformat
import sqlBuilder



proc delete*(queryArg: JsonNode, db: proc) =
  var queryString = deleteSql()
                  .fromSql(queryArg)
                  .joinSql(queryArg)
                  .whereSql(queryArg)
                  .orWhereSql(queryArg)
                  .limitSql(queryArg)
                  .offsetSql(queryArg)

  echo queryString
  db().exec(sql queryString)
  db().close()


proc delete*(queryArg: JsonNode, id: int, db: proc) =
  var queryString = deleteSql()
                    .fromSql(queryArg)

  queryString.add(&" WHERE id = {id}")

  echo queryString
  db().exec(sql queryString)
  db().close()