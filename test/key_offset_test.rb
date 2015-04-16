gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/key_offset'

class KeyOffsetTest < Minitest::Test

  def test_it_accepts_custom_key
    key_offset = KeyOffset.new('41521')
    assert_equal '41521', key_offset.key
  end

  def test_it_generates_random_key
    key_offset = KeyOffset.new
    assert key_offset.key.length == 5
  end

  def test_random_key_creates_array_of_4
    key_offsets = KeyOffset.new.key_offsets
    assert key_offsets.size == 4
  end

  def test_it_outputs_array_of_offset_integers
    key_offset = KeyOffset.new('41521')
    assert_equal [41, 15, 52, 21], key_offset.key_offsets
  end

  def test_it_can_do_high_integers
    key_offset = KeyOffset.new('98997').key_offsets
    assert_equal [98, 89, 99, 97], key_offset
  end

  def test_it_can_do_low_integers
    key_offset = KeyOffset.new('10211').key_offsets
    assert_equal [10, 2, 21, 11], key_offset
  end

  def test_it_can_do_consecutive_zeros
    key_offset = KeyOffset.new('10001').key_offsets
    assert_equal [10, 0, 0, 1], key_offset
  end

end
