import json
import strformat

let jsonNode = %*{"key": 3.14}
echo jsonNode["key"]
echo jsonNode["key"].type()
echo jsonNode["key"].getFloat()
echo jsonNode["key"].getFloat().type()

echo "=========================================="

let arr = %*[
    {"id": 0, "name": "user0"},
    {"id": 1, "name": "user1"},
    {"id": 2, "name": "user2"}
]
echo arr[1]["name"].getStr()

for val in arr:
    echo val["name"]

echo "=========================================="

# dealloc(arr.addr)
# var arr = @[""]
# echo arr
# echo arr.type()