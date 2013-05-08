require_relative 'Year_calendar'

month = ARGV[0].to_i
year = ARGV[1].to_i

if ARGV.size == 2
	cal = MonthCalendar.new( month, year )
	cal.print_month_calendar
else
	year = ARGV[0]
	cal = YearCalendar.new( year )
	cal.print_year_calendar
end