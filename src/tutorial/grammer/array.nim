import json
import strformat
import tables


echo "========== array固定長配列 =========="
var arr = ["a", "b", "c"]
echo arr
echo arr.type() # array[0..2, string]

echo "========== Sequence可変長配列 =========="
var sequence = @["a", "b", "c"]
echo sequence
echo sequence.type() # seq[string]

sequence.add("d")
echo sequence
echo sequence.type() # seq[string]

echo "========== hashTable連想配列(同じ型) =========="
var map = {"id": 1, "age": 29}
echo map
echo map.type() # array[0..1, tuple of (string, int)]
echo map[0][0]
echo map[1][1]

var hashTable = map.toTable()
echo hashTable
echo hashTable.type() # Table[system.string, system.int]
echo hashTable["id"]
echo hashTable["age"]

echo "========== jsonNode連想配列(色んな型) =========="
let jsonNode = %*{
  "id": 1,
  "name": "user1",
  "email": "user1@gmail.com"
}
echo jsonNode
echo jsonNode.type() # JsonNode
echo jsonNode["name"]
echo jsonNode["name"].type() # JsonNode
echo jsonNode["name"].getStr()
echo jsonNode["name"].getStr().type() # string

echo "=========================================="

let arr1 = %*[
    {"id": 0, "name": "user0"},
    {"id": 1, "name": "user1"},
    {"id": 2, "name": "user2"}
]
echo arr1[1]["name"].getStr()

for val in arr1:
    echo val["name"]

echo "=========================================="
