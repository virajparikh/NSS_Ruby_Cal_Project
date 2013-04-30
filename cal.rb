# require
month = ARGV[0]
year = ARGV[1]
puts `cal #{month} #{year}`


class Calendar
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
  	@month = month
  	@year = year
    month_hash = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December" }
    @month_name = month_hash.fetch(month)

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

  def month_year_header
    "#{@month_name} #{year}".center(20)
  end

  def days_header
    "Su Mo Tu We Th Fr Sa"
  end

  def days_in_month
    thirty_one = [1,3,5,7,8,10,12]
    thirty = [4,6,9,11]
    if thirty_one.include? month
      return 31
    elsif thirty.include? month
      return 30
    elsif month == 2 && leap_year?
      return 29
    else
      return 28
    end
  end

  def zeller
    m = @month
    y = @year
    if m == 1
      m = 13
      y = @year - 1
    elsif m == 2
      m = 14
      y = @year - 1
    # 3 = March, 4 = April, 5 = May, ..., 13 = January, 14 = February
    # for Jan or Feb, y = the previous year
    # q = 1 to get the first day of the month_name
    end
    return ((1 + ((26 * (m + 1)) / 10) + y + (y / 4) + (6 * (y / 100)) + (y / 400)) % 7)
    # 0 = Sat, 1 = Sun, 2 = Mon, 3 = Tues, 4 = Wed, 5 = Thurs, 6 = Fri
  end


  # def number_of_weeks_in_month
  #   # if month has 31 days and month begins on Friday or Saturday, then month has 6 weeks
  #   # elsif month has 30 days and month begins on Saturday, then month has 6 weeks
  #   # elsif month is February, is not a leap year, and begins on Sunday, then month has 4 weeks
  #   # else month has 5 weeks

  # end

end
