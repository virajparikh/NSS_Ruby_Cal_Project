require 'test/unit'
require './cal.rb'

class CalendarIntegrationTest < Test::Unit::TestCase

  def test_01_cal_output
    assert_equal(`cal 2 2012`,`ruby year_cal.rb 2 2012`)
  end

  def test_02a_leap_year?
    cal = Calendar.new(2000)
    assert_equal(true, cal.leap_year?)
  end

  def test_02b_leap_year?
    cal = Calendar.new(1997)
    assert_equal(false, cal.leap_year?)
  end

  def test_02c_leap_year?
    cal = Calendar.new(2100)
    assert_equal(false, cal.leap_year?)
  end

  def test_02d_leap_year?
    cal = Calendar.new(2400)
    assert_equal(true, cal.leap_year?)
  end

 

  # def test_3_number_of_weeks_in_month
  # 	cal = Calendar.new
  # 	assert_equal(6, `cal 3 2013`)
  # end


end
