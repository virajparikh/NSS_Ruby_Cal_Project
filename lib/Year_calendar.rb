# require 'Month_calendar'

class YearCalendar

  attr_reader :year

  def initialize(year)
    @year = year
    raise IndexError if @year < 1800 || @year > 3000
  end

  def year_calendar
    year_array = []
    (1..12).each do |month|
      year_array << MonthCalendar.new(month, @year).weeks_layout
    end
    puts year_array
  end

  # def first_row_header
  #   i = 0
  #   j = 0
  #   puts year_calendar[0][2].join(' ') + '  ' + year_calendar[1][2].join(' ') + '  ' + year_calendar[2][2].join(' ')
  # end

end

