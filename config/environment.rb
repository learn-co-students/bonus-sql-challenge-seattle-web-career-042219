#require 'bundler'
require 'sqlite3'
require 'pry'

#Bundler.require

# Setup a DB connection here

DB = SQLite3::Database.new ":daily_show_guests:"
