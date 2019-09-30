import db_sqlite, db_mysql, db_postgres
import json, strformat, system, tables, strformat, macros

type DBObject* = ref object of RootObj
  query*: JsonNode


proc table*(this: DBObject, tableArg: string): DBObject =
  this.query = %*{"table": tableArg}
  return this

proc get*(this: DBObject): seq =
  let table = this.query["table"].getStr()
  var sqlString = &"SELECT * FROM {table}"
  return this.connection().getAllRows(sql sqlString)
