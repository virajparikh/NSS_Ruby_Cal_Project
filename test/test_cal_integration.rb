require 'test/unit'
require './cal.rb'

class CalendarIntegrationTest < Test::Unit::TestCase

  def test_01_cal_output
    assert_equal(`cal 2 2012`,`ruby year_cal.rb 2 2012`)
  end

  def test_02a_leap_year?
    cal = Calendar.new(4, 2000)
    assert_equal(true, cal.leap_year?)
  end

  def test_02b_leap_year?
    cal = Calendar.new(2, 1997)
    assert_equal(false, cal.leap_year?)
  end

  def test_02c_leap_year?
    cal = Calendar.new(1, 2100)
    assert_equal(false, cal.leap_year?)
  end

  def test_02d_leap_year?
    cal = Calendar.new(10, 2400)
    assert_equal(true, cal.leap_year?)
  end
 
  def test_3_print_month_year_header
  	cal = Calendar.new(3, 2013)
  	assert_equal("     March 2013     ", cal.month_year_header)
  end

  def test_4_print_days_header
  	cal = Calendar.new(3, 2013)
  	assert_equal("Su Mo Tu We Th Fr Sa", cal.days_header)
  end

  

end
