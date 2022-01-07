#!usr/bin/ruby

require 'date'

#-----------------------------------------------#
#	Developer -- Shelby Rutland	
#	Date ------- April 5, 2021		
#						
#	This Ruby program uses Zeller’s Congruence
#	to compute and print the day of the week on
#	which a chosen date falls.		
#-----------------------------------------------#

#-----------------------------------------------#
#	zeller()				
#						
#	This will compute the day of the week	
#	using the formula for Zeller's Congruence.
#-----------------------------------------------#

def zeller(c,y,m,d)
	z = (d + ((m+1)*26/10).floor + y + (y/4).floor + (c/4) - 2*c + 7).floor % 7
	weekday = Date::DAYNAMES[z-1]
	return weekday
end

#-----------------------------------------------#
#	weekday()						
#						
#	This will print the day of the week and	
#	ensure the month, day, and year are in the
#	correct range.					
#-----------------------------------------------#

def weekday(month,day,year)
	if year < 1582 || year == 1582 && month < 10 || year == 1582 && month == 10 && day < 15
		puts "\nEnter a date after October 15, 1582\n\n"
		main
	else
		c = year / 100
		y = year % 100
		m = month
		d = day
		if (0..99).include?(y)
			if (1..31).include?(d)
				if (1..12).include?(m)
					weekday = zeller(c,y,m,d)
					print "Weekday -- ",weekday
					puts "\n\n"
					main
				else
					puts "\nEnter the month as an integer in the range 1-12\n\n"
					main
				end
			else
				puts "\nEnter the day as an integer in the range 1-31\n\n"
				main
			end
		else
			puts "\n the year as an integer where the right-most two digits are in the range 0-99\n\n"
			main
		end
	end
end

#-----------------------------------------------#
#	main					
#					
#	This will let the user enter integers	
#	indicating the month, day, and year:	
#	repeating until the user enters a null 	
#	string for the month number.		
#-----------------------------------------------#

def main
	print "Month ---- "
	s = gets.chomp
	unless s == ""
		month = s.to_i
		print "Day ------ "
		day = gets.chomp.to_i
		print "Year ----- "
		year = gets.chomp.to_i
		weekday(month,day,year)	
	end
end

main
