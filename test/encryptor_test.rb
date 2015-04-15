gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  #test it takes key,date
  #test it generates random key, date

  def test_it_generates_random_key
    encryptor = Encryptor.new('ruby')
    assert encryptor.key.length == 5
  end

  def test_it_groups_string_of_4
    encryptor = Encryptor.new('ruby', '41521', '020315')
    assert_equal [["r", "u", "b", "y"]], encryptor.group_by_4
  end

  def test_it_groups_string_of_8
    encryptor = Encryptor.new('rubylove', '41521', '020315')
    assert_equal [["r", "u", "b", "y"], ['l', 'o', 'v', 'e']], encryptor.group_by_4
  end

  def test_it_groups_string_of_9
    encryptor = Encryptor.new('ruby love', '41521', '020315')
    assert_equal [["r", "u", "b", "y"], [" ", "l", "o", "v"], ["e"]], encryptor.group_by_4
  end

  def test_it_rotates_string_of_4
    encryptor = Encryptor.new('ruby', '41521', '020315')
    assert_equal [["2", ".", "q", "l"]], encryptor.rotate_chars
  end

  def test_it_rotates_string_of_8
    encryptor = Encryptor.new('rubylove', '41521', '020315')
    assert_equal [["2", ".", "q", "l"], ["w", "5", " ", "4"]], encryptor.rotate_chars
  end

  def test_it_rotates_string_of_9
    encryptor = Encryptor.new('ruby love', '41521', '020315')
    assert_equal [["2", ".", "q", "l"], ["i", "2", "3", "i"], ["p"]], encryptor.rotate_chars
  end

  def test_it_encrypts_message
    encryptor = Encryptor.new('ruby love', '41521', '020315')
    assert_equal "2.qli23ip", encryptor.encrypted_message
  end

  def test_eugenes_code
    skip
    encryptor = Encryptor.new('h', '41512', '020315')
    assert_equal 'j', encryptor.encrypted_message
  end

  def test_michaels_code
    skip
    encryptor = Encryptor.new('hello world', '58241', '041515')
    assert_equal '', encryptor.encrypted_message
  end

end
