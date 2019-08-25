from strutils import parseInt
from json import `$`
include ../services/domain_services/SampleService

# html
include "../resources/templates/sample/index.tmpl"


proc index*(): string =
  # return "hello"
  return index_html()

proc fib*(num: string): string =
  let new_num = num.parseInt
  let data = SampleService().fib(new_num)
  return $data # $…JsonNodeを文字列にする
