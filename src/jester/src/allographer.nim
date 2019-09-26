import json

import allographer/queryBuilder
import allographer/sqlBuilder
import allographer/exec

export queryBuilder
export sqlBuilder
export exec


proc table*(table: string): JsonNode =
  %*{"table": table}
