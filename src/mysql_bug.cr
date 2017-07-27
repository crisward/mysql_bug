require "mysql"
DBURL = "mysql://root@127.0.0.1:3306?max_pool_size=3&initial_pool_size=5&max_idle_pool_size=3&retry_attempts=0"
Db    = DB.open(DBURL)

def get_row
  name = Db.query_one("select name from mysql_bug.test where id = 1", as: String)
end

def get_error
  begin
    name = Db.query_one("select blah from mysql_bug.test where id = 1", as: String)
  rescue
    name = ""
  end
end
