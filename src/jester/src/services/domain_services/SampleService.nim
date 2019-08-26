from json import `%*`, JsonNode
from strformat import `&`
import times
include ../ApplicationService

type SampleService* = ref object of RootObj

proc fib*(this: SampleService, num: int): JsonNode =
  var results: seq[int]
  
  let start_time = getTime()
  for i in 0..<num:
    results.add(ApplicationService().fib(i))
  let end_time = getTime() - start_time # Duration型

  var data = %*{ # %…配列をJsonNodeにする
    "version": "Nim " & NimVersion,
    "time": &"{end_time.seconds}.{end_time.microseconds}",
    "fib": results
  }
  return data