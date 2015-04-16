require_relative 'total_offset'

class Rotator

  attr_reader :key

  def initialize(date)
    @date = date
  end

  def set_key(key)
    @key = key
  end

  def rotator_array
    [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def total_offsets
    offsets = TotalOffset.new(@key, @date)
    offsets.total_offsets
  end

  def chars_grouped_by_4(message)
    message.chars.each_slice(4).map { |char| char }
  end

  def rotate_for_encryption(array_of_chars, offsets)
    array_of_chars.map.with_index do |char, index|
      rotator_array[((rotator_array.index(char) + offsets[index]) % 39)]
    end
  end

  def rotate_for_decryption(array_of_chars, offsets)
    array_of_chars.map.with_index do |char, index|
      rotator_array[((rotator_array.index(char) - offsets[index]) % 39)]
    end
  end

end
