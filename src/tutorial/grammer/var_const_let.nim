# 数値の宣言
var x1: int
var x2, x3: int

var
    y1, y2: int
    a1, a2: string

# コンパイル時定数
const x5 = 1
# x5 = 2 # error

const
  const_x = 1
  const_y = 2
  const_z = const_x + const_y
echo const_z

# 実行時定数
let let_x = 1
# let_x = 2 # error

# 実行時に値が決まるため可能 constは不可
echo "入力して"
let let_input = readLine(stdin)
echo let_input
