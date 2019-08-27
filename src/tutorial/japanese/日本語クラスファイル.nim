type 日本語クラス* = ref object of RootObj
 値: string

proc 日本語関数*(this: 日本語クラス): string =
    return this.値
