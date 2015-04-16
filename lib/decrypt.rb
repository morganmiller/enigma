require_relative 'decryptor'
require_relative 'printer'

class Decrypt < Printer

  def self.key
    ARGV[2]
  end

  def self.date
    ARGV[3]
  end

  def self.check_for_errors
    if ARGV.length != 4
      self.incorrect_num_arguments_decrypt
    end
  end

  def self.decrypt_the_message(input_file)
    decryptor = Decryptor.new(self.retrieve_message(input_file), self.key, self.date)
    decryptor.decrypted_message
  end

  def self.write_to_file
    file = self.get_ready_to_write(self.output_file)
    file.write(self.decrypt_the_message(self.input_file))
  end

  def self.print
    self.check_for_errors
    self.write_to_file
    puts "Created #{self.output_file} with the key #{self.key} and date #{self.date}"
  end
end

Decrypt.print

