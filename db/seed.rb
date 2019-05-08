# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require_relative '../config/environment'

rows = DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS guests (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    profession TEXT,
    show_date TEXT,
    group_profession TEXT,
    guest_list TEXT
  );
SQL

csv = 'daily_show_guests.csv'

CSV.parse(File.open(csv), headers: true) do |row|
  DB.execute("INSERT INTO guests(year, profession, show_date, group_profession, guest_list) VALUES ( ?, ?, ?, ?, ? )", row.fields) # equivalent to: [row['name'], row['age']]
end

DB.execute("SELECT * FROM guests")
