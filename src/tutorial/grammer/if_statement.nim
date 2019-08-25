# if文
import  strformat

echo "what is your name?"
let name = readLine(stdin)

if name == "":
  echo "名無しです"
elif name == "name":
  echo "your name is name"
else:
  echo &"hello {name}"
