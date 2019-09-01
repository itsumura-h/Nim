import json
import db_postgres

from ORM import db

type ManageUsersRepository* = ref object of RootObj

proc index*(this: ManageUsersRepository): JsonNode =
  let users = db().getAllRows(
    sql"select * from sample_users"
  )
  var json_users = %*[]
  for user in users:
    json_users.add(%*{
      "id": user[0],
      "name": user[1],
      "email": user[2],
      "birth_date": user[4],
      "created_at": user[5],
      "updated_at": user[6]
    })
  return %*json_users


proc show*(this: ManageUsersRepository, id: int): JsonNode =
  let user = db().getRow(
    sql"select * from sample_users where id = ?",
    id
  )
  echo user
  return %*{
    "id": user[0],
    "name": user[1],
    "email": user[2],
    "password": user[3],
    "birth_date": user[4],
    "created_at": user[5],
    "updated_at": user[6]
  }