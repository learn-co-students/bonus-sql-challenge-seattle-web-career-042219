# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  sql=<<-SQL
    SELECT name 
    FROM guests
    GROUP BY name
    ORDER BY count(id) ASC
    LIMIT 1
  SQL
end

guest_with_most_appearances