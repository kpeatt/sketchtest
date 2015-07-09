require 'sqlite3'

db = SQLite3::Database.new "test.sketch"
binary = db.execute "select value from payload where name = 'main'"
File.open("test.plist", 'w') { |file| file.write(binary[0][0]) }

%x(plutil -convert xml1 test.plist)
