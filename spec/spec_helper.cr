require "spec"
require "../src/mysql_bug"

Spec.before_each do
  Db.exec("Drop DATABASE IF EXISTS mysql_bug ")
  sql = "CREATE DATABASE IF NOT EXISTS mysql_bug"
  Db.exec(sql)
  sql = "
  CREATE TABLE IF NOT EXISTS mysql_bug.test (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
  )
  "
  Db.exec(sql)
  sql = %{Insert into mysql_bug.test Values (1,"Tom"),(2,"Dick"),(3,"Harry")}
  Db.exec(sql)
end

Spec.after_each do
  Db.exec("Drop DATABASE mysql_bug")
end
