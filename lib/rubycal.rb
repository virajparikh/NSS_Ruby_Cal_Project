require_relative 'Month_calendar'
require_relative 'Year_calendar'


if ARGV.size == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  cal = MonthCalendar.new( month, year )
  cal.print_month_calendar
else
  year = ARGV[0].to_i
  cal = YearCalendar.new( year )
  cal.first_row_header
end