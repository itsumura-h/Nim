# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import db_sqlite, db_mysql, db_postgres, json

include
  allographer/select,
  allographer/insert,
  allographer/update,
  allographer/delete,
  allographer/aggregate



proc table*(table: string): JsonNode =
  %*{"table": table}
