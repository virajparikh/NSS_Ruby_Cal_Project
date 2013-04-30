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
    raise IndexError if month < 1 || month > 12 || year < 1800 || year > 3000
    @month_name = month_hash.fetch(month)
  end

  def leap_year?
  	if year % 400 == 0  # if year is divisible by 400 then
  		true  # is_leap_year
  	elsif year % 100 == 0  # else if year is divisible by 100 then
  	  false  # not_leap_year
  	elsif year % 4 == 0  # else if year is divisible by 4 then
		  true  # is_leap_year
	  else  # else
		  false  # not_leap_year
	  end
  end

  def month_year_header
    "#{@month_name} #{year}".center(20)
  end

  def days_header
    "Su Mo Tu We Th Fr Sa\n"
  end

  def days_in_month
    thirty_one = [1,3,5,7,8,10,12]
    thirty = [4,6,9,11]
    if thirty_one.include? month
      return (1..31).to_a
    elsif thirty.include? month
      return (1..30).to_a
    elsif month == 2 && leap_year?
      return (1..29).to_a
    else
      return (1..28).to_a
    end
  end

  def zeller
    m = @month  # 3 = March, 4 = April, 5 = May, ..., 13 = January, 14 = February
    y = @year
    if m == 1
      m = 13  # January = 13 using Zeller's Congruence
      y = @year - 1  # for Jan, y = the previous year
    elsif m == 2
      m = 14  # February = 14 using Zeller's Congruence
      y = @year - 1  # for Feb, y = the previous year
    end
    return ((1 + ((26 * (m + 1)) / 10) + y + (y / 4) + (6 * (y / 100)) + (y / 400)) % 7)
    # q = 1 to get the first day of the month
    # output: 0 => Sat, 1 => Sun, 2 => Mon, 3 => Tues, 4 => Wed, 5 => Thurs, 6 => Fri
  end

  # def layout
  # #   if zeller == 1

  #   if days_in_month == 30 && zeller == 1
  #   #Sunday, 30 days
  #   "   September 2013\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30\n\n"
  #   elsif @month.days_in_month == 31 && @month.zeller == 1
  #   #Sunday, 31 days
  #   "   December 2013\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30 31\n\n"
  #   elsif @month.days_in_month == 30 && @month.zeller == 2
  #   #Monday, 30 days
  #   "     April 2013\nSu Mo Tu We Th Fr Sa\n    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30\n\n"
  #   elsif @month.days_in_month == 31 && @month.zeller == 2
  #   #Monday, 31 days
  #   "     July 2013\nSu Mo Tu We Th Fr Sa\n    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31\n\n"
  #   #Tuesday, 31 days
  #   "    October 2013\nSu Mo Tu We Th Fr Sa\n       1  2  3  4  5\n 6  7  8  9 10 11 12\n13 14 15 16 17 18 19\n20 21 22 23 24 25 26\n27 28 29 30 31\n\n"
  #   #Wednesday, 31 days
  #   "      May 2013\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"
  #   #Thursday, 31 days
  #   "    August 2013\nSu Mo Tu We Th Fr Sa\n             1  2  3\n 4  5  6  7  8  9 10\n11 12 13 14 15 16 17\n18 19 20 21 22 23 24\n25 26 27 28 29 30 31\n\n"
  #   #Friday, 31 days
  #   "     March 2013\nSu Mo Tu We Th Fr Sa\n                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31\n"
  #   #Saturday, 30 days
  #   "     June 2013\nSu Mo Tu We Th Fr Sa\n                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30\n"









  # def number_of_weeks_in_month
  #   # if month has 31 days and month begins on Friday or Saturday, then month has 6 weeks
  #   # elsif month has 30 days and month begins on Saturday, then month has 6 weeks
  #   # elsif month is February, is not a leap year, and begins on Sunday, then month has 4 weeks
  #   # else month has 5 weeks

  # end

end
