gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/date_offset'


class DateOffsetTest < Minitest::Test

  def test_date_returns_integer
    date_offset = DateOffset.new('120315')
    assert_equal 120315, date_offset.date
  end

  def test_date_drops_first_0
    date_offset = DateOffset.new('020315')
    assert_equal 20315, date_offset.date
  end

  def test_it_squares_the_date
    date_offset = DateOffset.new('020315')
    assert_equal 412699225, date_offset.squared_date
  end

  def test_it_returns_array_of_offsets
    date_offset = DateOffset.new('020315')
    assert_equal [9,2,2,5], date_offset.date_offsets
  end

end
