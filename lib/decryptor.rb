require_relative 'rotator'

class Decryptor

  def initialize(message_to_decrypt, key, date)
    @message_to_decrypt = message_to_decrypt
    @key = key
    @date = date
    @rotator = Rotator.new(@key, @date)
  end

  def chars_grouped_by_4
    @message_to_decrypt.chars.each_slice(4).map { |char| char }
  end

  def rotate_chars
    chars_grouped_by_4.map do |group|
      @rotator.rotate_for_decryption(group)
    end
  end

  def decrypted_message
    rotate_chars.flatten.join()
  end

end
