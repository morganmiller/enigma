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

  def test_it_outputs_array_of_offset_integers
    key_offset = KeyOffset.new('41521')
    assert_equal [41, 15, 52, 21], key_offset.key_offsets
  end

end
