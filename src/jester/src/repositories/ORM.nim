from db_postgres import open, DbConn

proc db*(): DbConn =
    let conn = open("rdb:5432","user","password","nim_sample")
    return conn
