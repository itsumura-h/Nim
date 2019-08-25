type NameValueObjet* = ref object of RootObj
  value: string

proc get_label*(this: NameValueObjet): string =
  return this.value