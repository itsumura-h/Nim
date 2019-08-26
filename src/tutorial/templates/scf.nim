#? stdtmpl | standard
# import json
#proc index_scf*(users: JsonNode): string =
#  result = ""
<table border="1">
  #for user in items(users):
    <tr>
      <td>${user["id"]}</td><td>${user["name"].str}</td>
    </tr>
  #end for
</table>