# Write methods that return SQL queries for each part of the challeng here
require_relative '../db/seed'

def guest_with_most_appearances
  	sql = <<-SQL
  		SELECT guest_list 
  		FROM guests
  		GROUP BY guest_list
  		ORDER BY count(guest_list) DESC
  		LIMIT 1
  	SQL

  	DB.execute(sql)
end

# print "1: " 
# puts guest_with_most_appearances

def most_popular_guest_profession_each_year
	sql = <<-SQL
		SELECT a.year, a.group_profession, COUNT(a.group_profession)
		FROM (SELECT year, group_profession, COUNT(id)
			FROM guests
		GROUP BY year, profession
		ORDER BY count(profession) DESC
		) a
		GROUP BY a.year
	SQL

	DB.execute(sql)
end
	
# print "2: " 
# puts most_popular_guest_profession_each_year

def most_popular_profession_overall
	sql = <<-SQL
		SELECT profession 
		FROM guests 
		GROUP BY profession
		ORDER BY COUNT(*) DESC
		LIMIT 1
	SQL

	DB.execute(sql)
end

# print "3: " 
# puts most_popular_profession_overall

def guests_with_first_name_bill
	sql = <<-SQL
		SELECT guest_list
		FROM guests 
		WHERE guest_list LIKE '%Bill %'
		GROUP BY guest_list
	SQL

	DB.execute(sql)
end

# print "4: " 
# puts guests_with_first_name_bill

def dates_with_patrick_stewart
	sql = <<-SQL
		SELECT year
		FROM guests 
		WHERE guest_list = 'Patrick Stewart'
	SQL

	DB.execute(sql)
end

# print "5: " 
# puts dates_with_patrick_stewart

def year_with_the_most_guests
	sql = <<-SQL
		SELECT year 
		FROM guests 
		GROUP BY year
		ORDER BY COUNT(*) DESC
		LIMIT 1
	SQL

	DB.execute(sql)
end

# print "6: " 
# puts year_with_the_most_guests

def most_popular_group_per_year
	sql = <<-SQL
		SELECT a.year, a.group_profession, COUNT(a.group_profession)
		FROM (SELECT year, group_profession, COUNT(id)
			FROM guests
			GROUP BY year, profession
			ORDER BY count(profession) DESC
			) a
		GROUP BY a.year
	SQL

	DB.execute(sql)
end

# print "7: " 
# puts most_popular_group_per_year
