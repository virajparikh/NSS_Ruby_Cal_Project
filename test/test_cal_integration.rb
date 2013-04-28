require 'test/unit'
require './cal.rb'

class CalendarIntegrationTest < Test::Unit::TestCase

  def test_01_cal_output
    assert_equal(`cal 2 2012`,`ruby cal.rb 2 2012`)
  end

  def test_02_leap_year
    cal = Calendar.new(1, 2100)
    assert cal.leap_year?
  end

end
