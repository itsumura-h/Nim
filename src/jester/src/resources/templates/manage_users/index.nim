import templates
import json

proc index_html* (users: JsonNode): string = tmpli html"""
  <h1>ManageUsers index</h1>
  <p><a href="/ManageUsers/create/">新規作成</a></p>
  <table border="1">
    $for user in users {
        <td>$(user[0].str)</td>
        <td><a href="/ManageUsers/$(user[0].str)/">$(user[1].str)</a></td>
        <td>$(user[2].str)</td>
        <td>$(user[3].str)</td>
        <td>$(user[4].str)</td>
        <td>$(user[5].str)</td>
        <td>$(user[6].str)</td>
      </tr>
    }
  </table>
  """
