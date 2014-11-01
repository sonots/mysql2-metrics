require 'mysql2'
require 'mysql2/metrics'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "test")
results = client.query("CREATE TABLE IF NOT EXISTS test (id INT)")
