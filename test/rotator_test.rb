gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/rotator'

class RotatorTest < Minitest::Test

  def test_rotator_array
    rotator = Rotator.new('41521', '020315')
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], rotator.rotator_array
  end

  def test_total_offsets
    rotator = Rotator.new('41521', '020315')
    assert_equal [50, 17, 54, 26], rotator.total_offsets
  end

  def test_rotate_for_encryption
    rotator = Rotator.new('41521', '020315')
    assert_equal ["2", ".", "q", "l"], rotator.rotate_for_encryption(['r', 'u', 'b', 'y'])
  end

  def test_rotate_for_decryption
    rotator = Rotator.new('41521', '020315')
    assert_equal ['r', 'u', 'b', 'y'], rotator.rotate_for_decryption(['2', '.', 'q', 'l'])
  end
end
