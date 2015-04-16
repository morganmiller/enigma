require_relative 'decryptor'
require 'pry'

class Cracker

  attr_reader :key

  def initialize(message_to_crack, date)
    @original = message_to_crack
    @message_to_crack = message_to_crack
    @date = date
    @key = '9999'
  end

  def matching_phrase?
    matching_phrase = '..end..'
    @message_to_crack[-7..-1] == matching_phrase
  end

  def break?
    @key == '99999'
  end

  def crack
    until matching_phrase?
      current_key = @key.to_i
      new_key = current_key += 1
      @key = new_key.to_s
      decryptor = Decryptor.new(@original, @key, @date)
      @message_to_crack = decryptor.decrypted_message
      break if break?
    end
    @message_to_crack
  end

end
