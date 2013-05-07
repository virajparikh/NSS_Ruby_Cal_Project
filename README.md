Nashville Software School project - Ruby Cal
============================================

Goal is to re-create the "cal" function in Ruby, to output the month and year calendar for whatever month-year combo inputed (e.g. cal 4 2013)

test is in: test/test_cal_integration.rb

program is in: lib/class_calendar.rb

run program in: lib/rubycal.rb

** in the Command Line, run 'ruby rubycal.rb 6 2013'

unit tests include: 

1. calendar output

2. is a leap year?

3. print month and year header

4. print days header

5. assign number of days to each month, in array format

6. using Zeller's Congruence, determine the first day of the month for any month and year combo

7. raise an index error for any month < 1 or > 12, or any year < 1800 or > 3000

8. if a month starts on Sunday (or Monday, Tues, etc.), what will the first line look like

9. what will the second, third, fourth lines look like

10. what will the last line look like