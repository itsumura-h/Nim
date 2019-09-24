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