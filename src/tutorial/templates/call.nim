import json
include scf
include nim_tmpl

let users = %*[
  {"id": 0, "name": "user0"},
  {"id": 1, "name": "user1"},
  {"id": 2, "name": "user2"}
]

echo index_scf(users)
echo index_nim_tmpl(users)


echo users[1]["name"]
echo users[1]["name"].type
echo users[1]["name"].str
echo users[1]["name"].str.type()