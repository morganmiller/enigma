require_relative 'encryptor'
require_relative 'printer'

class Encrypt < Printer

  def self.check_for_errors
    if ARGV.length != 2
      self.incorrect_num_arguments_encrypt
    end
  end

  def self.encrypt_the_message(input_file)
    @encryptor = Encryptor.new(self.retrieve_message(input_file))
    @encryptor.encrypted_message
  end

  def self.write_to_file
    file = self.get_ready_to_write(self.output_file)
    file.write(self.encrypt_the_message(self.input_file))
    file.write ("\n")
    file.write(@encryptor.key)
    file.write ("\n")
    file.write(@encryptor.date)
  end

  def self.print
    self.check_for_errors
    self.write_to_file
    puts "Created #{self.output_file} with the key #{@encryptor.key} and the date #{@encryptor.date}"
  end
end

Encrypt.print
