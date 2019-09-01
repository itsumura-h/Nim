import templates
import json

proc index_html*(header: string, users: string): string = tmpli html"""
<h1>ManageUsers index</h1>
<p><a href="/ManageUsers/create/">新規作成</a></p>
<div id="app">
  <v-app>
    <v-data-table
      :headers="headers"
      :items="users"
      :items-per-page="10"
      class="elevation-1"
    ></v-data-table>
  </v-app>
</div>
<script>
  new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    data() {
      return {
        headers: JSON.parse('$(header)'),
        users: JSON.parse('$(users)')
      }
    }
  })
</script>
"""