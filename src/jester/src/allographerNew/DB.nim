# import db_sqlite, db_mysql, db_postgres

type Database* = ref object of RootObj
  connType: string
  conn: proc

proc DB*(conn: proc): Database =
  const database = Database()
  database.conn = conn
  return database