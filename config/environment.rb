require 'bundler'
Bundler.require

require_relative '../lib/queries'
require_relative '../db/seed'
# Setup a DB connection here
@db = SQLite3::Database.new("guests.db")
@db.execute("DROP TABLE IF EXISTS guests;")