require 'csv'
require "sqlite3"
require 'pry'
require_relative "../config/environment.rb"

# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.

#db = SQLite3::Database ":daily_show_guests:"

rows = DB.execute <<-SQL
  create table users (
    ID INTEGER primary key,
    Year int,
    Occupation varchar(30),
    show_date varchar(30),
    group_type varchar(30),
    Name varchar(30)
  );
  SQL


  csv = CSV.read('daily_show_guests.csv')
  CSV.foreach('daily_show_guests.csv', headers: true) do |row|
    DB.execute "insert into users(Year, Occupation, Show_Date, Group_Type, Name) values (?, ?, ?, ?, ? )", row.fields
  end

  DB.execute( "select * from users" )
