import templates
import json

proc base_html*(context: string): string = tmpli html"""
<html>
  <head>
  </head>
  <body>
    <script src="/static/js/vue.js"></script>
    $(context)
  </body>
</html>
"""