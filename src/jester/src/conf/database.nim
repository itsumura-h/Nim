import ../allographerNew/allographer
import db_sqlite

proc conn*(this: DBObject): DbConn =
    let conn = open("/home/db/db.sqlite3", "", "", "")
    return conn

export DBObject, allographer

# import db_sqlite
# let conn = open("/home/db/db.sqlite3", "", "", "")
# export conn