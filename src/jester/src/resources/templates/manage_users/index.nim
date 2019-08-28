import templates
import json

proc index_html* (users: JsonNode): string = tmpli html"""
  <h1>ManageUsers index</h1>
  <p><a href="/ManageUsers/create/">新規作成</a></p>
  <p><a href="/ManageUsers/1/">ユーザー1</a></p>
  <table border="1">
    $for user in users {
      <tr>
        $for row in user {
          <td>$(row.str)</td>
        }
      </tr>
    }
  </table>
  """
