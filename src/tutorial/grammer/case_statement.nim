import  strformat
from strutils import  parseInt

# case文
echo "what is your name?"
let name = readLine(stdin)

case name
of "":
  echo "名無しです"
of "name":
  echo "your name is name"
else:
  echo &"hello, {name}"

echo "数字を入力して"
# let number = parseInt(readLine(stdin))
let number = stdin.readLine().parseInt()
# let number = stdin.readLine.parseInt
let rest = number mod 2
case rest
of 0:
  echo &"{number}は偶数です"
else:
  echo &"{number}は奇数です"