require 'bundler'
Bundler.require

# Setup a DB connection here
require 'sqlite3'
require 'csv'
require 'pry'

DB = SQLite3::Database.new ":memory:"