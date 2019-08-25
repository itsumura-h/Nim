import json
import strformat

# let jsonNode = parseJson("""{"key": 3.14}""")
let jsonNode = %*{"key": 3.14}
echo jsonNode["key"].getFloat()

# let jsonNode2 = %*{id": 1, "name": "user1}
# echo jsonNode2["name"].getStr()

# let arr = seq[JsonNode]
let arr = %*[
    {"id": 0, "name": "user0"},
    {"id": 1, "name": "user1"},
    {"id": 2, "name": "user2"}
]
echo arr[1]["name"].getStr()

for val in arr:
    echo val["name"]