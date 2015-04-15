class KeyOffset

  def initialize(key = generate_random_key)
    @key = key
  end

  def generate_random_key
    @key = rand(100000).to_s
  end

  def key
    @key
  end

  def key_offsets
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

end
