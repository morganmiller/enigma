require_relative 'total_offset'

class Rotator

  def initialize(date)
    @date = date
  end

  def set_key(key)
    @key = key
  end

  def rotator_array
    @rotator_array = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
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

  def crack_algorithm(index_1, index_2)
    value = (index_2 - index_1).abs
    39 - value
  end

  def cracked_offsets(chars, end_map)
    offsets = []
    offsets << crack_algorithm(rotator_array.index(chars[0]), rotator_array.index(end_map[0])) #can't use this, need to use whichever char is at correct starting index
    offsets << crack_algorithm(rotator_array.index(chars[1]), rotator_array.index(end_map[1]))
    offsets << crack_algorithm(rotator_array.index(chars[2]), rotator_array.index(end_map[2]))
    offsets << crack_algorithm(rotator_array.index(chars[3]), rotator_array.index(end_map[3]))
    offsets
  end

end
