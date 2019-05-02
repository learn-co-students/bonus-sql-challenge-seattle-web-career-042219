# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "csv"
require "sqlite3"
require "pry"
require_relative "../config/environment.rb"

db = SQLite3::Database.new "guests"

rows = db.execute <<-SQL
  create table guests (
      id INTEGER PRIMARY KEY,
      year INTEGER,
      occupation TEXT,
      show_date TEXT,
      group_type TEXT,
      name TEXT
  );
SQL

csv = CSV.read("daily_show_guests.csv")
CSV.foreach("daily_show_guests.csv", headers: true) do |row|
  db.execute "INSERT INTO guests(year, occupation, show_date, group_type, name) VALUES (?, ?, ?, ?, ?)", row.fields 
end

puts db.execute( "SELECT * FROM guests LIMIT 1" ) 