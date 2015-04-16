gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/cracker'


class CrackerTest < Minitest::Test

  def test_it_returns_offsets
    skip
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal [24, 22, 4, 34], cracker.cracked_total_offsets
  end

  def test_rotate_chars
    skip
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal "mytest..end..", cracker.rotate_chars
  end

  def test_it_finds_matching_key_for_message_and_date
    skip
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal "22029", cracker.crack
  end

  def test_it_cracks_a_funky_message
    encrypted = "b3nbs4xtvtw0v7qhs7t91tr0abf2zud08zdu"
    date = "150415"

    assert Decryptor.new(encrypted, "19817", date).decrypted_message.end_with?("..end..")

    cracker = Cracker.new(encrypted, "150415")
    key = cracker.crack
    assert_equal "19817", cracker.crack
  end
end
