import json

import allographer/grammars
import allographer/builders
import allographer/exec

export grammars
export builders
export exec


proc table*(table: string): JsonNode =
  %*{"table": table}
