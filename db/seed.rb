# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.

require_relative "../config/environment.rb"

sql = <<-SQL
  CREATE TABLE guests (
      id INTEGER PRIMARY KEY,
      year INTEGER,
      occupation TEXT,
      show_date TEXT,
      group_type TEXT,
      name TEXT
  );
SQL

DB.execute(sql)

CSV.foreach("daily_show_guests.csv", headers: true) do |row|
  DB.execute "INSERT INTO guests(year, occupation, show_date, group_type, name) VALUES (?, ?, ?, ?, ?)", row.fields 
end
puts "seeds done"
puts DB.execute( "SELECT * FROM guests LIMIT 1" ) 