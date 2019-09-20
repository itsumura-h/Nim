# html
include ../resources/templates/toppages/index
include ../resources/templates/toppages/vue
include ../resources/templates/toppages/react

proc index*(): string =
  return indexHtml()

proc react*(): string =
  let message = "React Installed"
  return reactHtml(message)

proc vue*(): string =
  let message = "Vue Installed"
  return vueHtml(message)