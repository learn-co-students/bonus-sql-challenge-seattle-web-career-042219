# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "csv"
require "sqlite3"
require "pry"

def new_db(db_path)
  SQLite3::Database.new(db_path)
end
def new_table(db_path, table_name)
  db = SQLite3::Database.new(db_path)
  db.execute('CREATE TABLE guests (
    id INTEGER PRIMARY KEY,
    name TEXT,
    year TEXT,
    profession TEXT,
    show_date TEXT,
    category TEXT);')
end
def import_csv_to_table(csv_path, db_path, table_name)
    db = SQLite3::Database.new(db_path)

    CSV.foreach(File.open(csv_path)) do |row|

    year = row[0]
    profession = row[1].downcase
    show_date = row[2]
    category = row[3]
    name = row[4]

    db.execute <<-SQL
    INSERT INTO #{table_name} (
      name,
      year,
      profession,
      show_date,
      category)
    VALUES (
      '#{name}',
      '#{year}',
      '#{profession}',
      '#{show_date}',
      '#{category}');
    SQL

    # db.execute("INSERT INTO #{table_name} (name, year, profession, show_date, category) VALUES (" + name + ", " + year + ", " + profession + ", " + show_date + ", " + category + ");")


  end
end

new_table('../db.db', 'guests')

import_csv_to_table('../daily_show_guests.csv', '../db.db', 'guests')
