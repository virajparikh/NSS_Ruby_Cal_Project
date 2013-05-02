require 'test/unit'
require './cal.rb'

class CalendarIntegrationTest < Test::Unit::TestCase

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
  	assert_equal("     March 2013      ", cal.month_year_header)
  end

  def test_4_print_days_header
  	cal = Calendar.new(3, 2013)
  	assert_equal("Su Mo Tu We Th Fr Sa\n ", cal.days_header)
  end

  def test_5a_days_in_month
    cal = Calendar.new(5, 2012)
    assert_equal((1..31).to_a, cal.days_in_month)
  end

  def test_5b_days_in_month
    cal = Calendar.new(2, 2012)
    assert_equal((1..29).to_a, cal.days_in_month)
  end

  def test_5c_days_in_month
    cal = Calendar.new(2, 2011)
    assert_equal((1..28).to_a, cal.days_in_month)
  end

  def test_5d_days_in_month
    cal = Calendar.new(4, 3000)
    assert_equal((1..30).to_a, cal.days_in_month)
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
  	cal = Calendar.new(9, 2010)
  	assert_equal(4, cal.zeller)
  end

  def test_6d_zeller
  	cal = Calendar.new(12, 2096)
  	assert_equal(0, cal.zeller)
  end

  def test_6e_zeller
  	cal = Calendar.new(1, 2004)
  	assert_equal(5, cal.zeller)
  end

  def test_6f_zeller
    cal = Calendar.new(2, 2024)
    assert_equal(5, cal.zeller)
  end

  def test_7a_index_error
    assert_raise IndexError do
      cal = Calendar.new(13, 1977)
    end
  end

  def test_7b_index_error
    assert_raise IndexError do
      cal = Calendar.new(1, 1797)
    end
  end

  def test_7c_index_error
    assert_raise IndexError do
      cal = Calendar.new(-3, 1977)
    end
  end

  def test_7d_index_error
    assert_raise IndexError do
      cal = Calendar.new(-2, 4000)
    end
  end

  # def test_8_first_line_spaces
  #   cal = Calendar.new(1, 2004)
  #   assert_equal([" "," "," "," "," "," "," "," "," "," "," "," "], cal.layout)
  # end


end
