require_relative 'rotator'
# require 'pry'

class Cracker

  def initialize(message_to_crack, date)
    @message_to_crack = message_to_crack
    @date = date
    @rotator = Rotator.new(date)
  end

  def starting_index
    ((@message_to_crack.length - 7) % 4)
  end

  def encrypted_end_message
    @message_to_crack[-7..-1]
  end

  def encrypted_message_abcd
    msg_map = []
    msg_map << encrypted_end_message[starting_index]
    msg_map << encrypted_end_message[starting_index + 1]
    msg_map << encrypted_end_message[starting_index + 2]
    msg_map << encrypted_end_message[starting_index + 3]
    msg_map
  end

  def end_message_abcd
    arr = '..end..'.chars
    end_map = []
    end_map << arr[starting_index]
    end_map << arr[starting_index + 1]
    end_map << arr[starting_index + 2]
    end_map << arr[starting_index + 3]
    end_map
  end

  def cracked_total_offsets
    @rotator.cracked_offsets(end_message_abcd, encrypted_message_abcd)
  end

  def group_by_4
    @rotator.chars_grouped_by_4(@message_to_crack)
  end

  def rotate_chars
    group_by_4.map do |group|
      @rotator.rotate_for_encryption(group, cracked_total_offsets)
    end
  end


end
#
# cracker = Cracker.new("hx,dcc629h6w", "150415")
# assert_equal [10,20,30,40], cracker.rotate_chars
