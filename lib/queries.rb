require_relative "../config/environment.rb"

def guest_with_most_appearances
  sql = <<-SQL
    SELECT name 
    FROM guests
    GROUP BY name
    ORDER BY COUNT(name) DESC
    LIMIT 1
  SQL
  DB.execute(sql).first
end

def most_popular_profession_by_year
# What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?
end

def most_profession_overall
# What profession was on the show most overall?
end

def most_bills
# How many people did Jon Stewart have on with the first name of Bill?
end

def first_partrick_stewart
# What dates did Patrick Stewart appear on the show?
end

def year_with_most_guests
# Which year had the most guests?
end

def most_popular_group_by_year
# What was the most popular "Group" for each year Jon Stewart hosted?
end

binding.pry
0