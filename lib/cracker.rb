require_relative 'decryptor'
require 'pry'

class Cracker
  attr_accessor :key

  def initialize(message_to_crack, date)
    @original = message_to_crack
    @message_to_crack = message_to_crack
    @date = date
    @rotator = Rotator.new(date)
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
    @key
  end


  #
  # def starting_index
  #   ((@message_to_crack.length - 7) % 4)
  # end
  #
  # def encrypted_end_message
  #   @message_to_crack[-7..-1]
  # end
  #
  # def encrypted_piece
  #
  #   encrypted_end_message[starting_index..starting_index + 3]
  # end
  #
  # def end_piece
  #   '..end..'[starting_index..starting_index + 3]
  # end
  #
  # def break?
  #   @key == '99999'
  # end
  #
  # def crack_it
  #   decrypted = '....'
  #   until decrypted == end_piece
  #     current_key = @key.to_i
  #     new_key = current_key += 1
  #     @key = new_key.to_s
  #     decryptor = Decryptor.new(encrypted_piece, @key, @date)
  #     decrypted = decryptor.decrypted_message
  #     break if break?
  #   end
  #   puts "loops executed"
  # end
  #
  # def decrypt_it
  #   crack_it
  #   decryptor = Decryptor.new(@message_to_crack, @key, @date)
  #   return decryptor.decrypted_message
  # end

end

#works = mytest..end..
# cracker = Cracker.new(" hx,dcc629h6w", "150415")
# puts cracker.crack
#
# #works = mytest2222..end..
# cracker2 = Cracker.new("g7t4m22pw..y.wdy5", "150415")
# puts cracker2.decrypt_it
# puts cracker2.key
#
# #works = mytest22..end..
# cracker3 = Cracker.new("6610,1 lsgm9xgg", "150415")
# puts cracker3.decrypt_it
# puts cracker3.key

# #doesn't work = mytest222..end..
# cracker4 = Cracker.new("ea.6k8g03t553n", "150415")
# puts cracker4.decrypt_it
# puts cracker4.key
#
# cracker5 = Cracker.new("b3nbs4xtvtw0v7qhs7t91tr0abf2zud08zdu", "150415")
# puts cracker5.decrypt_it
# puts cracker5.key

