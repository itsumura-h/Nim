from json import `%*`, `[]`, JsonNode
import db_postgres
import os
import strutils

type ManageUsersRepository* = ref object of RootObj

proc db_conn(): DbConn =
  # let conn = open("nim_rdb_1:5432","user","password","nim_sample")
  let conn = open("", "user", "password", "host=nim_rdb_1 port=5432 dbname=nim_sample")
  echo conn.pghost
  conn.close()
  return conn

proc index*(this: ManageUsersRepository): JsonNode =
  let db = db_conn()
  let users = db.getAllRows(
    sql"select * from sample_users"
  )
  echo users

  return %*[
    {"id": 0, "name": "user0"},
    {"id": 1, "name": "user1"},
    {"id": 2, "name": "user2"}
  ]