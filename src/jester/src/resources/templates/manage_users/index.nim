import templates
import json

proc index_html* (users: JsonNode): string = tmpli html"""
<h1>ManageUsers index</h1>
<p><a href="/ManageUsers/create/">新規作成</a></p>
<!-- <table border="1">
  $for user in users {
  <tr>
    <td>$(user[0].str)</td>
    <td><a href="/ManageUsers/$(user[0].str)/">$(user[1].str)</a></td>
    <td>$(user[2].str)</td>
    <td>$(user[3].str)</td>
    <td>$(user[4].str)</td>
    <td>$(user[5].str)</td>
    <td>$(user[6].str)</td>
  </tr>
  }
</table> -->
<div id="app">
  <v-app>
    <v-content>
      <v-container>Hello world</v-container>
    </v-content>
    <!-- {{users}} -->
    <v-simple-table>
      <thead>
        <tr>
          <th class="text-left">id</th>
          <th class="text-left">name</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user[0]">
          <td>{{ user[0] }}</td>
          <td>{{ user[1] }}</td>
        </tr>
      </tbody>
    </v-simple-table>
  </v-app>
</div>
<script>
  new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    data() {
      return {
        users: JSON.parse('$(users)')
      }
    },
    mounted() {
      this.show_users()
    },
    methods: {
      show_users: function () {
        console.log(this.users[0])
      }
    }
  })
</script>
"""