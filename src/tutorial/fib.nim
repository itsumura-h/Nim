import  times
import  strformat

proc fib(n: int): int =
  if n < 2:
    return n
  return fib(n - 2) + fib(n - 1)

let start_time = getTime()
echo(fib(37))
let end_time = getTime() - start_time
echo &"{end_time.seconds}.{end_time.microseconds}"