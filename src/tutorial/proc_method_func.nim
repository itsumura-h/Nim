proc procA(a:int, b:int): int =
  return a + b

func funcA(a:var int, b:var int): int =
  a = 7
  # echo a #エラー
  return a + b

type A = ref object
method methodA(this: A, a:int, b:int): int {.base.} =
  var aa = a
  aa = 9
  return aa + b


# ==================== main ====================

echo procA(1, 2)

var
  one = 1
  two = 2
echo funcA(one, two)

echo A().methodA(1, 2)

