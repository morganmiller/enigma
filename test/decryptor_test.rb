gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_knows_message
    message = Decryptor.new("8dsf2. det", "41251", "020315").message_to_decrypt
    assert_equal "8dsf2. det", message
  end

  def test_it_knows_date
    date = Decryptor.new("8dsf2. det", "41251", "020315").date
    assert_equal "020315", date
  end

  def test_it_knows_key
    key = Decryptor.new("8dsf2. det", "41251", "020315").key
    assert_equal "41251", key
  end

  def test_it_groups_4_by_4
    group = [["2", ".", "q", "l"]]
    decryptor = Decryptor.new("2.ql", "41521", "020315")
    assert_equal group, decryptor.group_by_4
  end

  def test_it_groups_8_by_4
    group = [["2", ".", "q", "l"], ["i", "2", "3", "i"]]
    decryptor = Decryptor.new("2.qli23i", "41521", "020315")
    assert_equal group, decryptor.group_by_4
  end

  def test_it_groups_uneven_message_by_4
    group = [["2", ".", "q", "l"], ["i", "2", "3", "i"], ["p"]]
    decryptor = Decryptor.new("2.qli23ip", "41521", "020315")
    assert_equal group, decryptor.group_by_4
  end

  def test_it_decrypts_message
    decryptor = Decryptor.new("2.qli23ip", "41521", "020315")
    assert_equal "ruby love", decryptor.decrypted_message
  end

end
