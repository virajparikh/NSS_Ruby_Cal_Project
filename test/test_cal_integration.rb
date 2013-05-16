require 'test/unit'
require './lib/Month_calendar.rb'
require './lib/Year_calendar.rb'

class CalendarTest < Test::Unit::TestCase

  def test_01a_cal_output
    assert_equal(`cal 2 2012`,`ruby cal.rb 2 2012`)
  end

  def test_01b_cal_output
    assert_equal(`cal 3 2013`,`ruby cal.rb 3 2013`)
  end

  def test_01c_cal_output
    assert_equal(`cal 2 2015`,`ruby cal.rb 2 2015`)
  end

  def test_01d_cal_output
    assert_equal(`cal 6 2013`,`ruby cal.rb 6 2013`)
  end

  def test_02a_leap_year?
    cal = MonthCalendar.new(4, 2000)
    assert_equal(true, cal.leap_year?)
  end

  def test_02b_leap_year?
    cal = MonthCalendar.new(2, 1997)
    assert_equal(false, cal.leap_year?)
  end

  def test_02c_leap_year?
    cal = MonthCalendar.new(1, 2100)
    assert_equal(false, cal.leap_year?)
  end

  def test_02d_leap_year?
    cal = MonthCalendar.new(2, 2400)
    assert_equal(true, cal.leap_year?)
  end

  def test_02e_leap_year?
    cal = MonthCalendar.new(2, 2012)
    assert_equal(true, cal.leap_year?)
  end
 
  def test_3_print_month_year_header
  	cal = MonthCalendar.new(3, 2013)
  	assert_equal("     March 2013", cal.month_year_header)
  end

  # def test_4_print_days_header
  # 	cal = MonthCalendar.new(3, 2013)
  # 	assert_equal("     March 2013\nSu Mo Tu We Th Fr Sa\n", cal.complete_header)
  # end

  def test_5a_days_in_month
    cal = MonthCalendar.new(5, 2012)
    assert_equal((1..31).to_a, cal.days_in_month)
  end

  def test_5b_days_in_month
    cal = MonthCalendar.new(2, 2012)
    assert_equal((1..29).to_a, cal.days_in_month)
  end

  def test_5c_days_in_month
    cal = MonthCalendar.new(2, 2011)
    assert_equal((1..28).to_a, cal.days_in_month)
  end

  def test_5d_days_in_month
    cal = MonthCalendar.new(4, 3000)
    assert_equal((1..30).to_a, cal.days_in_month)
  end

  def test_6a_zeller
  	cal = MonthCalendar.new(3, 1996)
  	assert_equal(6, cal.zeller)
  end

  def test_6b_zeller
  	cal = MonthCalendar.new(6, 2013)
  	assert_equal(7, cal.zeller)
  end

  def test_6c_zeller
  	cal = MonthCalendar.new(9, 2010)
  	assert_equal(4, cal.zeller)
  end

  def test_6d_zeller
  	cal = MonthCalendar.new(12, 2096)
  	assert_equal(7, cal.zeller)
  end

  def test_6e_zeller
  	cal = MonthCalendar.new(1, 2004)
  	assert_equal(5, cal.zeller)
  end

  def test_6f_zeller
    cal = MonthCalendar.new(2, 2024)
    assert_equal(5, cal.zeller)
  end

  def test_7a_index_error
    assert_raise IndexError do
      cal = MonthCalendar.new(13, 1977)
    end
  end

  def test_7b_index_error
    assert_raise IndexError do
      cal = MonthCalendar.new(1, 1797)
    end
  end

  def test_7c_index_error
    assert_raise IndexError do
      cal = MonthCalendar.new(-3, 1977)
    end
  end

  def test_7d_index_error
    assert_raise IndexError do
      cal = MonthCalendar.new(-2, 4000)
    end
  end

  # def test_8a_days_with_spaces
  #   cal = MonthCalendar.new(4, 2003)
  #   assert_equal(0, cal.days_with_spaces)
  # end

  # def test_8a_print_month_layout
  #   cal = MonthCalendar.new(2, 2009)
  #   assert_equal(" 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n\n\n", cal.print_month_calendar)
  # end

  # def test_8b_month_layout
  #   cal = MonthCalendar.new(3, 2013)
  #   assert_equal("                1  2\n 3  4  5  6  7  8  9\n10 11 12 13 14 15 16\n17 18 19 20 21 22 23\n24 25 26 27 28 29 30\n31\n", cal.print_month_calendar)
  # end

  # def test_8c_month_layout
  #   cal = MonthCalendar.new(2, 2012)
  #   assert_equal("          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29\n\n", cal.print_month_calendar)
  # end

  # def test_8d_month_layout
  #   cal = MonthCalendar.new(2, 2016)
  #   assert_equal("    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29\n\n", cal.print_month_calendar)
  # end

  # def test_8e_month_layout
  #   cal = MonthCalendar.new(5, 2100)
  #   assert_equal("                   1\n 2  3  4  5  6  7  8\n 9 10 11 12 13 14 15\n16 17 18 19 20 21 22\n23 24 25 26 27 28 29\n30 31\n", cal.print_month_calendar)
  # end

  # def test_8f_month_layout
  #   cal = MonthCalendar.new(2, 2100)
  #   assert_equal("    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28\n\n", cal.print_month_calendar)
  # end

  # def test_8g_month_layout
  #   cal = MonthCalendar.new(1, 2014)
  #   assert_equal("          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n", cal.print_month_calendar)
  # end

  ##### testing YearCalendar class below #######

  # def test_9_year_header
  #   cal = YearCalendar.new(2013)
  #   assert_equal("                             2013\n\n", cal.year_header)
  # end

  # def test_10_first_month_set_header
  #   cal = YearCalendar.new(2013)
  #   assert_equal("      January               February               March\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n", cal.first_month_set_header)
  # end

  def test_11_print_year
    cal = YearCalendar.new(2013)
    assert_equal(0, cal.print_year_calendar)
  end

  def test_12_first_row_header
    cal = YearCalendar.new(2013)
    assert_equal(0, cal.first_row_header)
  end

end
