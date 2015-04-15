class DateOffset

  def initialize(date = Time.now.strftime("%-d%m%y"))
    @date = date.to_i
  end

  def date
    @date
  end

  def squared_date
    @date**2
  end

  def date_offsets
    squared_date.to_s.chars.last(4).map(&:to_i)
  end

end
