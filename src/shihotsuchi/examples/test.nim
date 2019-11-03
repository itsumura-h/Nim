import macros

dumpAstGen:
  get "/":
    resp root()
  get "/test":
    resp test()