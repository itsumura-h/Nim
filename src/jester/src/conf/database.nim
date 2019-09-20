import db_sqlite

proc db*(): DbConn =
    let conn = open("/home/db/db.sqlite3", "", "", "")
    return conn

# from db_postgres import open, DbConn

# proc db*(): DbConn =
#     let conn = open("rdb:5432","user","password","nim_sample")
#     return conn
    