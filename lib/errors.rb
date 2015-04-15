class ErrorMessages

  def self.read_file_error
    raise ArgumentError, "I need a file to read!" if ARGV[0] == nil #|| ARGV[0] != #filetype?
  end

  def self.write_file_error
    raise ArgumentError, "I need a file to write to!" if ARGV[1] == nil #|| ARGV[1] != #filetype?
  end

  def self.wrong_date_error
    raise ArgumentError, "I need to know the date that this message was encrypted! (ddmmyy)" if ARGV[3] == nil || ARGV[3].length != 6
  end

  def self.wrong_key_error
    raise ArgumentError, "I need a 5-digit key to decrypt!" if ARGV[2] == nil || ARGV[2].length != 5
  end
end
