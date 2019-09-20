import allographer, json
include conf/database


var result = table("users").select("id", "name", "email").get(db)
echo result