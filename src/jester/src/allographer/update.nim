import json
import sqlBuilder


proc update*(queryArg: JsonNode, items: JsonNode): string =
  return updateSql(queryArg)
        .updateValuesSql(items)
        .joinSql(queryArg)
        .whereSql(queryArg)
        .orWhereSql(queryArg)
        .limitSql(queryArg)
        .offsetSql(queryArg)
