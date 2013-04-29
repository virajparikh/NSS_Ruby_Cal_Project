# require
month = ARGV[0]
year = ARGV[1]
puts `cal #{month} #{year}`


class Calendar
  attr_reader :month
  attr_reader :year

  def initialize( year)
  	@month = month
  	@year = year
  end

  def leap_year?
  # 	if year is divisible by 400 then
	#    is_leap_year
	# 	else if year is divisible by 100 then
	#    not_leap_year
	# 	else if year is divisible by 4 then
	#    is_leap_year
	# 	else
	#    not_leap_year
  	if year % 400 == 0
  		true
  	elsif year % 100 == 0
  	  false
  	elsif year % 4 == 0
		  true
	  else
		  false
	  end
  end

  def number_of_weeks_in_month
    # if month has 31 days and month begins on Friday or Saturday, then month has 6 weeks
    # elsif month has 30 days and month begins on Saturday, then month has 6 weeks
    # elsif month is February, is not a leap year, and begins on Sunday, then month has 4 weeks
    # else month has 5 weeks

  # end

end

class Day

# # days = [ :Su, :Mo, :Tu, :We, :Th, :Fr, :Sa ]

# class Month

 months = { 1 => :January,  2 => :February, 3 => :March, 4 => :April, 5 => :May, 6 => :June, 7 => :July, 8 => :August, 9 => :September, 10 => :October, 11 => :November, 12 => :December }  # these should be associated with a numbers.  Use hashses??
