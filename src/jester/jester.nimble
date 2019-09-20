# Package

version       = "0.1.0"
author        = "medy"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["jester"]

backend       = "cpp"

# Dependencies

requires "nim >= 0.20.2"
requires "asynctools = #pr_fix_compilation"
requires "bcrypt >= 0.2.1"
requires "httpbeast >= 0.2.2"
requires "jester >= 0.4.3"
requires "templates >= 0.4"
