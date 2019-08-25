import strformat

echo("what is your name?")
var name: string = readLine(stdin) # 標準入力から受け取る
echo("hello, ", name)

# 文字列への変数埋め込み
var repry1: string = fmt"hello, {name}"
var reply2: string = &"hello, {name}"
echo(repry1)
echo(reply2)

# 型推論
var name2 = "medy"
echo(&"hello, {name2}")
