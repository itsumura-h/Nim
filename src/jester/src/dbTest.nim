import allographer, json
include conf/database


var result = table("users").select("id", "email", "name").offset(10).limit(5).get(db)
echo result

echo ""

result = table("users").select("id", "email", "name").where("id", ">", 4).where("id", "<=", 10).get(db)
echo result

echo ""

result = table("users").select("id", "name").where("name", "LIKE", "%20").orWhere("name", "LIKE", "%30").get(db)
echo result

echo ""

result = table("users").select("id", "name").orWhere("name", "LIKE", "%30").get(db)
echo result

echo ""

var resultRow = table("users").find(3, db)
echo resultRow

echo ""

resultRow = table("users").select("name", "address").find(3, db)
echo resultRow

echo ""

echo table("users")
      .select("users.name", "users.auth_id")
      .join("auth", "auth.id", "=", "users.auth_id")
      .join("a", "a.name", "=", "auth.name")
      .where("users.auth_id", "=", "1")
      .get(db)

echo ""

resultRow = table("users").select("name", "address").where("name", "LIKE", "%20").first(db)
echo resultRow

echo ""

resultRow = table("users").first(db)
echo resultRow

echo ""

table("users").select("name", "address").where("name", "LIKE", "%20").getSqlCheck()
echo table("users").select("name", "address").where("name", "LIKE", "%20").countRows(db)
echo table("users").select().where("name", "LIKE", "%20").countOne(db)

echo ""

table("users").insert(%*{"name": "taro", "email": "taro@gmail.com"}, db)