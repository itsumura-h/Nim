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

echo table("users").select("name", "address").where("name", "LIKE", "%20").countColumns(db)
echo table("users").select().where("name", "LIKE", "%20").count(db)

echo ""

table("users").insert(%*{"name": "John", "email": "John@gmail.com"}, db)

echo ""

table("users").insert(
  [
    %*{"name": "John", "email": "John@gmail.com", "address": "ロンドン"},
    %*{"name": "Paul", "email": "Paul@gmail.com", "address": "ロンドン"},
    %*{"email": "George@yahoo.co.jp", "birth_date": "1990-1-1", "address": "ロンドン"}
  ],
  db
)

echo ""

echo table("users").where("address", "=", "ロンドン").get(db)
table("users").where("address", "=", "ロンドン").delete(db)
echo table("users").where("address", "=", "ロンドン").get(db)

echo ""

table("users").delete(1, db)