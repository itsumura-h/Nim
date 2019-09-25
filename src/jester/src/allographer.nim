import db_sqlite, db_mysql, db_postgres, json

include
  allographer/select,
  allographer/insert,
  allographer/update,
  allographer/delete,
  allographer/aggregate

import allographer/sqlBuilder
export sqlBuilder

proc table*(table: string): JsonNode =
  %*{"table": table}
