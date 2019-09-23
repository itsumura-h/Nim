import json

include
  allographer/select,
  allographer/insert,
  allographer/update,
  allographer/delete,
  allographer/aggregate

proc table*(table: string): JsonNode =
  %*{"table": table}