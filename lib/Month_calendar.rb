class MonthCalendar
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
    # see definition of Zeller's Congruence to find the day of the week of whatever date picked: http://en.wikipedia.org/wiki/Zeller's_congruence
    m = @month
    y = @year
    if m == 1
      m = 13
      y = @year - 1
    elsif m == 2
      m = 14
      y = @year - 1
    end
    # q = 1 to get the first day of the month
    firstDay = ((1 + ((26 * (m + 1)) / 10) + y + (y / 4) + (6 * (y / 100)) + (y / 400)) % 7)
    # output: 0 => Sat, 1 => Sun, 2 => Mon, 3 => Tues, 4 => Wed, 5 => Thurs, 6 => Fri
    firstDay = 7 if firstDay == 0 #converts Saturday to 7
    firstDay
  end

  def days_in_month
    thirty_one = [1,3,5,7,8,10,12]
    thirty = [4,6,9,11]
    if thirty_one.include? @month
      return (1..31).to_a
    elsif thirty.include? @month
      return (1..30).to_a
    elsif leap_year?
      return (1..29).to_a
    else
      return (1..28).to_a
    end
  end

  def month_year_header
    month_name = MONTHS[@month - 1]
    "#{month_name} #{year}".center(20)
  end

  # def days_with_spaces
  #   begin_space = []
  #   i = 1
  #   until i == zeller
  #     begin_space << "   "
  #     i += 1
  #   end

  #   all_days_array = days_in_month
  #   all_days_array.collect! do |date|
  #     if date < 10 && date != 1
  #       "  " + date.to_s
  #     else
  #       " " + date.to_s
  #     end
  #   end
  #   days_with_spaces_array = begin_space
  #   days_with_spaces_array += all_days_array
  #   days_with_spaces_array
  # end

  def weeks_layout
    begin_space = []
    i = 1
    until i == zeller
      begin_space << "   "
      i += 1
    end
  
    all_days_array = days_in_month
    all_days_array.collect! do |date|
      if date < 10 && date != 1
        "  " + date.to_s
      else
        " " + date.to_s
      end
    end
    days_and_spaces_array = begin_space
    days_and_spaces_array += all_days_array

    weeks = []
    weeks << [month_year_header]
    weeks << ["Su Mo Tu We Th Fr Sa"]
    j = 0
    while j < 6  #6 weeks max
      seven_days = days_and_spaces_array.shift(7) #plucks the first 7 string elements from the array
      seven_days = seven_days.join
      seven_days.slice!(0) unless j == 0 #slicing off the first space of each line
      weeks << [seven_days]
      # calendar << "\n"  #line break at the end of each line
      j += 1 #up to 6 weeks max
    end
    weeks
  end

  def print_month_calendar
    weeks_layout.each do |week|
      puts week.join
    end
  end

end