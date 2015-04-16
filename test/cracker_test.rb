gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/cracker'


class CrackerTest < Minitest::Test

  def test_matching_phrase_returns_true
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    cracker.crack
    assert cracker.matching_phrase?
  end

  def test_matching_phrase_returns_false
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    refute cracker.matching_phrase?
  end

  def test_it_finds_matching_key_for_message_and_date
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal "mytest..end..", cracker.crack
  end

  def test_it_cracks_a_funky_message
    encrypted = "b3nbs4xtvtw0v7qhs7t91tr0abf2zud08zdu"
    date = "150415"
    assert Decryptor.new(encrypted, "19817", date).decrypted_message.end_with?("..end..")
    cracker = Cracker.new(encrypted, "150415")
    assert_equal "this is a really long message..end..", cracker.crack
  end


end
