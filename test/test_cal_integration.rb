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

  def test_5a_days_in_month
    cal = Calendar.new(5, 2012)
    assert_equal(31, cal.days_in_month)
  end

  def test_5b_days_in_month
    cal = Calendar.new(2, 2012)
    assert_equal(29, cal.days_in_month)
  end

  def test_5c_days_in_month
    cal = Calendar.new(2, 2011)
    assert_equal(28, cal.days_in_month)
  end

  def test_5d_days_in_month
    cal = Calendar.new(4, 3125)
    assert_equal(30, cal.days_in_month)
  end

  def test_6a_zeller
  	cal = Calendar.new(3, 1996)
  	assert_equal(6, cal.zeller)
  end

  def test_6b_zeller
  	cal = Calendar.new(6, 2013)
  	assert_equal(0, cal.zeller)
  end

  def test_6c_zeller
  	cal = Calendar.new(1, 2015)
  	assert_equal(5, cal.zeller)
  end

  def test_6d_zeller
  	cal = Calendar.new(2, 2024)
  	assert_equal(0, cal.zeller)
  end


end
