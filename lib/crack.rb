require 'pry'
require_relative 'cracker'

class Crack

  def self.input_file
    raise ArgumentError, "I need a file to read!" if ARGV[0] == nil #|| ARGV[0] != #filetype?
    ARGV[0]
  end

  def self.output_file
    raise ArgumentError, "I need a file to write to!" if ARGV[1] == nil #|| ARGV[1] != #filetype?
    ARGV[1]
  end

  def self.date
    raise ArgumentError, "I need to know the date that this message was encrypted! (ddmmyy)" if ARGV[2] == nil || ARGV[2].length != 6
    ARGV[2]
  end

  def self.message_to_crack(input_file)
    file = File.open(input_file, "r")
    file.readline.chomp
  end

  def self.decrypt_the_message(input_file)
    cracker = Cracker.new(self.message_to_crack(input_file), self.date)
    @cracked_message = cracker.crack
    @key = cracker.key
  end

  def self.write_to_file(output_file)
    self.decrypt_the_message(self.input_file)
    file = File.open(output_file, "w")
    file.write(@cracked_message)
  end

  def self.print
    self.write_to_file(self.output_file)
    puts "Created #{self.output_file} with the key #{@key} and date #{self.date}"
  end

end

Crack.print
