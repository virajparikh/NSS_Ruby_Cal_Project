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
    "#{@month_name} #{year}".center(20).rstrip
  end

  def complete_header
    "#{month_year_header}\nSu Mo Tu We Th Fr Sa\n"
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
    firstDay = ((1 + ((26 * (m + 1)) / 10) + y + (y / 4) + (6 * (y / 100)) + (y / 400)) % 7)
    # q = 1 to get the first day of the month
    # output: 0 => Sat, 1 => Sun, 2 => Mon, 3 => Tues, 4 => Wed, 5 => Thurs, 6 => Fri
    firstDay = 7 if firstDay == 0 #convert Saturday to 7
    firstDay
  end

  def month_layout
    beginSpace = []
    i = 1
    until i == zeller
    beginSpace << "   "
    i += 1
    end
    days_array = beginSpace
    allDays = days_in_month
    allDays.collect! do |days|
      if days < 10 && days != 1
        "  " + days.to_s
      else
        " " + days.to_s
      end
    end
    days_array += allDays
    days_array
    calendar = []
    z = 0
    while z < 6
      newdays = days_array.shift(7)
      newdays = newdays.join
      newdays.slice!(0) unless z == 0
      calendar <<  newdays
      calendar << "\n"
      z += 1
    end
    calendar = calendar.join
  end

  def print_month_calendar
    print "#{complete_header}#{month_layout}"
  end
end


# if month has 31 days and month begins on Friday or Saturday, then month has 6 weeks
# elsif month has 30 days and month begins on Saturday, then month has 6 weeks
# elsif month is February, is not a leap year, and begins on Sunday, then month has 4 weeks
# else month has 5 weeks
  
  # def first_row_layout
  #   z = zeller
  #   if z == 0
  #     spaces = 18
  #   else 
  #     spaces = (z - 1) * 3
  #   end
  #   layoutArray = []
  #   spaces.times do 
  #     layoutArray << " "
  #   end
    
  #     i = 0
  #     count = spaces + 1
  #     while count <= 20


  #   while days_in_month
  #      if i < 9
  #       layoutArray << days_in_month.shift
  #       count += 1
  #       i += 1
  #       if count == 20
  #         layoutArray << "\n"
  #         count = 0
  #         layoutArray << days_in_month[i]
  #         count += 1
  #         i += 1
  #       else
  #         layoutArray << "  "
  #         count += 2
  #         else layoutArray << " "
  #         count += 1
  #       else
  # end