gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_reads_message
    assert_equal "ruby love", Encrypt.message_to_encrypt("./lib/message.txt")
  end

  def test_it_encrypts_message
    assert_equal "2.qli23ip", Encrypt.encrypt_the_message("./lib/message.txt")
  end

end
