require_relative 'date_offset'
require_relative 'key_offset'

class TotalOffset

  def initialize(key, date)
    @key = key
    @date = date
  end

  def date_offsets
    calc_date_offsets = DateOffset.new(@date)
    calc_date_offsets.date_offsets
  end

  def key_offsets
    calc_key_offsets = KeyOffset.new(@key)
    calc_key_offsets.key_offsets
  end

  def total_offsets
    date_offsets.zip(key_offsets).map {|num| num.inject(:+)}
  end

end
