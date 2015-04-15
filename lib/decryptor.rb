require_relative 'rotator'

class Decryptor

  def initialize(message_to_decrypt, key, date)
    @message_to_decrypt = message_to_decrypt
    @key = key
    @date = date
    @rotator = Rotator.new(@key, @date)
  end

  def group_by_4
    @rotator.chars_grouped_by_4(@message_to_decrypt)
  end

  def rotate_chars
    group_by_4.map do |group|
      @rotator.rotate_for_decryption(group)
    end
  end

  def decrypted_message
    rotate_chars.flatten.join()
  end

end
