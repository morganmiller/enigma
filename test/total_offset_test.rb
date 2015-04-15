gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/total_offset'

class TotalOffsetTest < Minitest::Test

  def test_returns_date_offsets
    total_offset = TotalOffset.new('41521', '020315')
    assert_equal [9, 2, 2, 5], total_offset.date_offsets
  end

  def test_returns_key_offsets
    total_offset = TotalOffset.new('41521', '020315')
    assert_equal [41, 15, 52, 21], total_offset.key_offsets
  end

  def test_total_offsets
    total_offset = TotalOffset.new('41521', '020315')
    assert_equal [50, 17, 54, 26], total_offset.total_offsets
  end

end
