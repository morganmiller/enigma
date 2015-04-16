require_relative 'rotator'
require_relative 'key_offset'
require_relative 'date_offset'

class Encryptor

  attr_reader :key, :date

  def initialize(message_to_encrypt, key = KeyOffset.new.key, date = DateOffset.new.date)
    @message_to_encrypt = message_to_encrypt
    @date = date
    @rotator = Rotator.new(@date)
    @key = @rotator.set_key(key)
  end

  def group_by_4
    @rotator.chars_grouped_by_4(@message_to_encrypt)
  end

  def rotate_chars
    group_by_4.map do |group|
      @rotator.rotate_for_encryption(group, @rotator.total_offsets)
    end
  end

  def encrypted_message
    rotate_chars.flatten.join()
  end

end
