require 'pry'
require_relative 'cracker'
require_relative 'printer'

class Crack < Printer

  def self.date
    ARGV[2]
  end

  def self.check_for_errors
    if ARGV.length != 3
      self.incorrect_num_arguments_crack
    end
  end

  def self.decrypt_the_message(input_file)
    cracker = Cracker.new(self.retrieve_message(input_file), self.date)
    @cracked_message = cracker.crack
    binding.pry
    @key = cracker.key
  end

  def self.write_to_file(output_file)
    file = self.get_ready_to_write(output_file)
    self.decrypt_the_message(self.input_file)
    file.write(@cracked_message)
  end

  def self.print
    self.check_for_errors
    self.write_to_file(self.output_file)
    puts "Created #{self.output_file} with the key #{@key} and date #{self.date}"
  end

end

Crack.print
