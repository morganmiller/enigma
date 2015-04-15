gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_decrypts_message
    decryptor = Decryptor.new("2.qli23ip", "41521", "020315")
    assert_equal "ruby love", decryptor.decrypted_message
  end

end
