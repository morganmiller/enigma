require_relative 'total_offset'

class Rotator

  def initialize(key, date)
    @key = key
    @date = date
  end

  def rotator_array
    @rotator_array = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def total_offsets
    offsets = TotalOffset.new(@key, @date)
    offsets.total_offsets
  end

  def rotate_for_encryption(array_of_chars)
    array_of_chars.map.with_index do |char, index|
      rotator_array[((rotator_array.index(char) + total_offsets[index]) % 39)]
    end
  end

  def rotate_for_decryption(array_of_chars)
    array_of_chars.map.with_index do |char, index|
      rotator_array[((rotator_array.index(char) - total_offsets[index]) % 39)]
    end
  end

end
