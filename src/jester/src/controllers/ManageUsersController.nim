from json import `%*`, `$`, `[]`, JsonNode, getStr
from strutils import parseInt

# html
include ../resources/templates/manage_users/index
# include "../resources/templates/manage_users/index2.tmpl"
include "../resources/templates/manage_users/create.tmpl"
include "../resources/templates/manage_users/show.tmpl"

proc index*(): string =
  let users = %*[
    {"id": 0, "name": "user0"},
    {"id": 1, "name": "user1"},
    {"id": 2, "name": "user2"}
  ]
  # 公式テンプレートエンジンSCF
  # https://nnahito.com/articles/23
  # https://nim-lang.org/docs/filters.html
  # 3rd party 
  # https://github.com/onionhammer/nim-templates
  # https://github.com/onionhammer/nim-templates/blob/master/tests/templates_tests.nim
  return index_html(users)
  # return index_html2(users)

proc create*(): string =
  return create_html()

proc show*(): string =
  return show_html()

proc update*(id: string): string =
  let new_id = id.parseInt
  var data = %*{"id": new_id}
  return $data
