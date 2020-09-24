# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  "SELECT name, COUNT(name) FROM guests GROUP BY name ORDER BY COUNT(name) DESC LIMIT 1"
end

def most_popular_profession_by_year
  "SELECT year, profession, COUNT(profession) FROM guests GROUP BY year ORDER BY year DESC"
end

def most_popular_profession
    "SELECT profession, COUNT(profession) FROM guests GROUP BY profession ORDER BY  COUNT(profession) DESC LIMIT 1"
end

def how_many_bills
  "SELECT name FROM guests WHERE name LIKE '%Bill' GROUP BY name"
end

def patrick_stewart_shows
  "SELECT name, show_date FROM guests WHERE name = 'Patrick Stewart' ORDER BY show_date ASC"
end

def most_guesty_year
  "SELECT year, COUNT(name) FROM guests GROUP BY year ORDER BY COUNT(name) DESC LIMIT 1"
end

def popular_group_per_year
  "SELECT year, category, COUNT(category) FROM guests GROUP BY year ORDER BY year DESC"
end
