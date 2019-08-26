import templates
import json

proc index_html2* (users: JsonNode): string = tmpli html"""
  <h1>ManageUsers index</h1>
  <p><a href="/ManageUsers/create/">新規作成</a></p>
  <p><a href="/ManageUsers/1/">ユーザー1</a></p>
  <table border="1">
    $for user in users{
      <tr>
        <td>$(user["id"])</td><td>$(user["name"].str)</td>
      </tr>
    }
  </table>
  """