import jester
from json import `%*`, `[]`, `$`, JsonNode, getStr
from strutils import parseInt

# service
include ../services/domain_services/ManageUsersService

# html
include "../resources/templates/base.nim"
include "../resources/templates/manage_users/index.nim"
include "../resources/templates/manage_users/show.nim"
# include "../resources/templates/manage_users/create.nim"
include ../resources/templates/manage_users/create

proc index*(): string =
  let users = ManageUsersService().index()
  return base_html(index_html(users))

proc create*(): string =
  return create_html()

proc store*(request: Request): string =
  var params = request.params
  # echo params
  echo params["name"]
  echo params["email"]
  echo params["birth_date"]
  return ""

proc show*(str_id: string): string =
  let id = str_id.parseInt
  let user = ManageUsersService().show(id)
  return show_html(user)

proc update*(str_id: string): string =
  let id = str_id.parseInt
  var data = %*{"id": id}
  return $data
