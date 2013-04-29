month = ARGV[0]
year = ARGV[1]
puts `cal #{month} #{year}`

# require 'month_cal'

class Calendar
  attr_reader :month
  attr_reader :year

  def initialize( month, year )
  	@month = month
  	@year = year
  end

  def leap_year
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

end
