require_relative 'rotator'
require_relative 'key_offset'
require_relative 'date_offset'

class Encryptor

  def initialize(message_to_encrypt, key = KeyOffset.new.key, date = DateOffset.new.date)
    @message_to_encrypt = message_to_encrypt
    @key = key
    @date = date
    @rotator = Rotator.new(@key, @date)
  end

  def group_by_4
    @rotator.chars_grouped_by_4(@message_to_encrypt)
  end

  def rotate_chars
    group_by_4.map do |group|
      @rotator.rotate_for_encryption(group)
    end
  end

  def encrypted_message
    rotate_chars.flatten.join()
  end

  def key
    @key
  end

  def date
    @date
  end

end
