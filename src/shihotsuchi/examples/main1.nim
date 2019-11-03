import ../src/shihotsuchi
import json, times, strformat
from strutils import parseInt


proc root():string =
  return "root"

proc test():string =
  return "test"

proc num(num:string): string =
  return num

routings:
  # get "/":
  #   resp root()
  # get "/test":
  #   resp test()
  # get "/num/@id":
  #   resp fib(@"id")
  path(get, "/", root())
  path(get, "/test", test())
  # path(get, "/fib/@id", num(@"id"))

runForever()


#[
StmtList
  Call
    Ident "path"
    Ident "get"
    StrLit "/"
    Call
      Ident "root"
  Call
    Ident "path"
    Ident "get"
    StrLit "/test"
    Call
      Ident "test"
]#

#[
StmtList
  Command
    Ident "get"
    StrLit "/"
    StmtList
      Command
        Ident "resp"
        Call
          Ident "root"
  Command
    Ident "get"
    StrLit "/test"
    StmtList
      Command
        Ident "resp"
        StrLit "test"
]#
