#? stdtmpl | standard
# import json
#proc index_html*(users: JsonNode): string =
#  result = ""
<h1>ManageUsers index</h1>
<p><a href="/ManageUsers/create/">新規作成</a></p>
<p><a href="/ManageUsers/1/">ユーザー1</a></p>
<table border="1">
  #for user in items(users):
    <tr>
      <td>${user["id"]}</td><td>${user["name"].str}</td>
    </tr>
  #end for
</table>
