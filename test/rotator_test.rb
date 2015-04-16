gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/rotator'

class RotatorTest < Minitest::Test

  def test_initialize
    rotator = Rotator.new("020315")
    assert rotator
  end

  def test_set_key
    rotator = Rotator.new("020315")
    rotator.set_key('55555')
    assert_equal '55555', rotator.key
  end

  def test_rotator_array
    rotator = Rotator.new('020315')
    rotator.set_key('41521')
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], rotator.rotator_array
  end

  def test_total_offsets
    rotator = Rotator.new('020315')
    rotator.set_key('41521')
    assert_equal [50, 17, 54, 26], rotator.total_offsets
  end

  def test_total_offsets_2
    rotator = Rotator.new('150415')
    rotator.set_key('93552')
    assert_equal [95, 37, 57, 57], rotator.total_offsets
  end

  def test_low_offsets
    rotator = Rotator.new('010101')
    rotator.set_key('11111')
    assert_equal [11,13,11,12], rotator.total_offsets
  end

  def test_high_offsets
    rotator = Rotator.new('291299')
    rotator.set_key('99999')
    assert_equal [106, 103, 99, 100], rotator.total_offsets
  end

  def test_one_char_grouped_by_4
    rotator = Rotator.new('230505')
    group = rotator.chars_grouped_by_4("m")
    assert_equal [["m"]], group
  end

  def test_few_chars_grouped_by_4
    rotator = Rotator.new('230505')
    group = rotator.chars_grouped_by_4("hey")
    assert_equal [["h","e","y"]], group
  end

  def test_4_chars_grouped_by_4
    rotator = Rotator.new('230505')
    group = rotator.chars_grouped_by_4("moon")
    assert_equal [["m", "o", "o", "n"]], group
  end

  def test_many_chars_grouped_by_4
    rotator = Rotator.new('230505')
    group = rotator.chars_grouped_by_4("here is a message")
    assert_equal [["h", "e", "r", "e"], [" ", "i", "s", " "], ["a", " ", "m", "e"], ["s", "s", "a", "g"], ["e"]], group
  end

  def test_rotate_1_for_encryption
    rotator = Rotator.new('230505')
    rotator.set_key('41521')
    group = rotator.rotate_for_encryption(["m"], rotator.total_offsets)
    assert_equal ["t"], group
  end

  def test_rotate_4_for_encryption
    rotator = Rotator.new('020315')
    rotator.set_key('41521')
    assert_equal ["2", ".", "q", "l"], rotator.rotate_for_encryption(['r', 'u', 'b', 'y'], rotator.total_offsets)
  end

  def test_rotate_2_for_encryption
    rotator = Rotator.new('020315')
    rotator.set_key('93525')
    assert_equal ["c", "s"], rotator.rotate_for_encryption(["r", "u"], rotator.total_offsets)
  end

  def test_rotate_3_for_encryption
    rotator = Rotator.new('020315')
    rotator.set_key('93525')
    assert_equal ["c", "s", "q"], rotator.rotate_for_encryption(["r", "u", "b"], rotator.total_offsets)
  end

  def test_rotate_1_for_decryption
    rotator = Rotator.new('230505')
    rotator.set_key('41521')
    group = rotator.rotate_for_decryption(["t"], rotator.total_offsets)
    assert_equal ["m"], group
  end

  def test_rotate_2_for_decryption
    rotator = Rotator.new('020315')
    rotator.set_key('93525')
    assert_equal ["r", "u"], rotator.rotate_for_decryption(["c", "s"], rotator.total_offsets)
  end

  def test_rotate_3_for_decryption
    rotator = Rotator.new('020315')
    rotator.set_key('93525')
    assert_equal ["r", "u", "b"], rotator.rotate_for_decryption(["c", "s", "q"], rotator.total_offsets)
  end

  def test_rotate__4_for_decryption
    rotator = Rotator.new('020315')
    rotator.set_key('41521')
    assert_equal ['r', 'u', 'b', 'y'], rotator.rotate_for_decryption(['2', '.', 'q', 'l'], rotator.total_offsets)
  end

end
