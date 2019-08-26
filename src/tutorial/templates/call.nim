import json
include scf
include nim_tmpl

let users = %*[
  {"id": 0, "name": "user0"},
  {"id": 1, "name": "user1"},
  {"id": 2, "name": "user2"}
]

echo index_scf(users)
# 公式テンプレートエンジンSCF
# https://nnahito.com/articles/23
# https://nim-lang.org/docs/filters.html

echo index_nim_tmpl(users)
# 3rd party 
# https://github.com/onionhammer/nim-templates
# https://github.com/onionhammer/nim-templates/blob/master/tests/templates_tests.nim


echo users[1]["name"]
echo users[1]["name"].type
echo users[1]["name"].str
echo users[1]["name"].str.type()