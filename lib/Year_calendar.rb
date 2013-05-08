require 'Month_calendar'

class YearCalendar

  def initialize(year)
  	@year = year
    raise IndexError if year < 1800 || year > 3000
  end

  def year_header
    "#{@year}".center(63).rstrip + "\n\n"
  end

  def first_month_set_header
    first_set = "      January               February               March\n"
    days_of_week = "Su Mo Tu We Th Fr Sa"
    first_month_set_header = first_set + days_of_week + "  " + days_of_week + "  " + days_of_week + "\n"
  end

  # def complete_header
  #   "#{month_year_header}\nSu Mo Tu We Th Fr Sa\n"
  # end


  # def print_year_calendar
  #   print "#{ }#{ }"
  # end

end

