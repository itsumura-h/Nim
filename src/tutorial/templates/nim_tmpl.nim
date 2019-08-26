import templates
import json

proc index_nim_tmpl* (users: JsonNode): string = tmpli html"""
  <table border="1">
    $for user in users{
      <tr>
        <td>$(user["id"])</td><td>$(user["name"].str)</td>
      </tr>
    }
  </table>
  """
