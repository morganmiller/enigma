gem 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/cracker'


class CrackerTest < Minitest::Test

  def test_it_returns_offsets
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal [24, 22, 4, 34], cracker.cracked_total_offsets
  end

  def test_rotate_chars
    cracker = Cracker.new(" hx,dcc629h6w", "150415")
    assert_equal "mytest..end..", cracker.rotate_chars
  end

end
