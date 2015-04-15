require_relative 'rotator'

class Cracker

  def initialize(message_to_crack, date)
    @message_to_crack = message_to_crack
    @date = date
  end

  def reverse_message
    @message_to_crack.chars.reverse
  end

  def group_by_4
    reverse.message.each_slice(4).map { |char| char }
  end


  ..end..







end
