class Calendar
  attr_reader :month
  attr_reader :year

  MONTHS = %w{ January February March April May June July August September October November December }

  def initialize(month, year)
  	@month = month
  	@year = year
    raise IndexError if month < 1 || month > 12 || year < 1800 || year > 3000
  end

  def leap_year?
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

  def zeller
    # see definition of Zeller's Congruence: http://en.wikipedia.org/wiki/Zeller's_congruence
    if @month == 1
      @month = 13
      @year = @year - 1
    elsif @month == 2
      @month = 14
      @year = @year - 1
    end
    # q = 1 to get the first day of the month
    firstDay = ((1 + ((26 * (@month + 1)) / 10) + @year + (@year / 4) + (6 * (@year / 100)) + (@year / 400)) % 7)
    # output: 0 => Sat, 1 => Sun, 2 => Mon, 3 => Tues, 4 => Wed, 5 => Thurs, 6 => Fri
    firstDay = 7 if firstDay == 0 #converts Saturday to 7
    firstDay
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
    calendar = []
    week = 0
    while week < 6  #6 weeks max
      newdays = days_array.shift(7) #plucking the first 7 string elements from the array
      newdays = newdays.join
      newdays.slice!(0) unless week == 0 #slicing off the first space of each line
      calendar <<  newdays
      calendar << "\n"  #line break at the end of each line
      week += 1 #up to 6 weeks max
    end
    calendar = calendar.join
  end

  def month_year_header
    month_name = MONTHS[@month - 1]
    "#{month_name} #{year}".center(20).rstrip
  end

  def complete_header
    "#{month_year_header}\nSu Mo Tu We Th Fr Sa\n"
  end

  def print_month_calendar
    print "#{complete_header}#{month_layout}"
  end
end