import json, strformat, sqlBuilder



proc delete*(queryArg: JsonNode): string =
  return deleteSql()
        .fromSql(queryArg)
        .joinSql(queryArg)
        .whereSql(queryArg)
        .orWhereSql(queryArg)
        .limitSql(queryArg)
        .offsetSql(queryArg)



proc delete*(queryArg: JsonNode, id: int): string =
  var queryString = deleteSql()
                    .fromSql(queryArg)

  queryString.add(&" WHERE id = {id}")
  return queryString
