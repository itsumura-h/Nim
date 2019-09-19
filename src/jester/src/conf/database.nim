import db_sqlite

proc db*(): DbConn =
    let conn = open("db.sqlite3", "", "", "")
    return conn

# from db_postgres import open, DbConn

# proc db*(): DbConn =
#     let conn = open("rdb:5432","user","password","nim_sample")
#     return conn
    