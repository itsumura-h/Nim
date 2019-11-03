# import allographerNew/base
import conf/database
import json

var db = DBObject().table("users").get()
echo repr db
