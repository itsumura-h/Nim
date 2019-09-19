import db_sqlite
import conf/database

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