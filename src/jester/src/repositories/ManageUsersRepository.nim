from json import `%*`, `[]`, JsonNode
import db_postgres
import os
import strutils
import json

type ManageUsersRepository* = ref object of RootObj

proc db_conn(): DbConn =
  let conn = open("rdb:5432","user","password","nim_sample")
  return conn

proc index*(this: ManageUsersRepository): JsonNode =
  let db = db_conn()
  let users = db.getAllRows(
    sql"select * from sample_users"
  )

  return %*users # seqをJsonNodeに変換
