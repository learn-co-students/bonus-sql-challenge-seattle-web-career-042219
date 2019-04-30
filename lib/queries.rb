# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  # write your query here!
  "SELECT Name
   FROM users
   GROUP BY Name
   ORDER BY COUNT(id) DESC
   LIMIT 1"
end

def most_popular_occupation_by_year
  "SELECT a.YEAR, a.Occupation
  FROM (SELECT Year, Occupation, COUNT(ID) as appearances
  FROM users
  GROUP BY Year, Occupation
  ORDER BY COUNT(ID) DESC) a
  GROUP BY a.YEAR
"
end

def overall_popular_occupation
  "SELECT  Occupation
  From  users
  Group by Occupation
  Order By Count(id) DESC
  LIMIT 1"
end



def pat_stewart_appearances
  "SELECT show_date
   FROM users
   WHERE NAME = 'Patrick Stewart'"
end

def year_with_most_guests
  "SELECT Year
  From users
  GROUP BY Year
  ORDER BY Count(ID) DESC
  Limit 1"
end

def popular_group_by_year
  "SELECT a.YEAR, a.GROUP_TYPE
FROM (SELECT Year, GROUP_TYPE, COUNT(ID) as appearances
FROM users
GROUP BY Year, GROUP_TYPE
ORDER BY COUNT(ID) DESC) a
GROUP BY a.YEAR"
end
