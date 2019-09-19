import db_sqlite
import conf/database
import json, strformat, sugar, hashes

db().exec(
  sql"DROP TABLE IF EXISTS auth"
)

db().exec(
  sql"""
    CREATE TABLE auth (
      id    INTEGER PRIMARY KEY AUTOINCREMENT,
      name  VARCHAR(255)
    )
  """
)

var auths = %*[
  {
    "id": 1,
    "name": "administrator"
  },
  {
    "id": 2,
    "name": "user"
  }
]

var args = ""
var i = 0
for row in auths:
  echo row["id"].getStr
  var id = row["id"].getInt()
  var name = row["name"].getStr()
  if i != 0:
    args.add(", ")
  i += 1
  args.add(&"({id}, '{name}')")

var query = &"INSERT INTO auth (id, name) VALUES {args}"
db().exec(sql query)

# ===============================================================

db().exec(
  sql"DROP TABLE IF EXISTS users"
)

db().exec(
  sql"""
    CREATE TABLE users (
      id          INTEGER PRIMARY KEY AUTOINCREMENT,
      name        VARCHAR(255),
      email       VARCHAR(255),
      password    VARCHAR(255),
      birth_date  DATE,
      auth_id     INTEGER,
      foreign key (auth_id) references auth(id)
    )
  """
)

var users = lc[
  {
    "id": i,
    "name": &"user{i}",
    "email": &"user{i}@gmail.com",
    "password": hash &"password{i}",

  }
]

args = ""
i = 0
