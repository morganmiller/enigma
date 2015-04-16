class KeyOffset

  def initialize(key = generate_random_key)
    @key = key
  end

  def generate_random_key
    @key = rand(10000..99999).to_s
  end

  def key
    @key
  end

  def key_offsets
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

end
