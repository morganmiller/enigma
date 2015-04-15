require_relative 'encryptor'

class Encrypt

  #use class methods, not initialize
  #are instance variables storing information about the state?
     #if not, not instance vars

  #Separate file for argument errors?

  def self.input_file
    # raise ArgumentError, "I need a file to read!" if ARGV[0] == nil #|| ARGV[0] != #filetype?
    ARGV[0]
  end

  def self.output_file
    # raise ArgumentError, "I need a file to write to!" if ARGV[1] == nil #|| ARGV[1] != #filetype?
    ARGV[1]
  end

  def self.message_to_encrypt(input_file = "message.txt")
    file = File.open(input_file, "r")
    file.read.chomp
  end

  def self.encrypt_the_message(input_file = "message.txt")
    @encryptor = Encryptor.new(self.message_to_encrypt(input_file))
    @encryptor.encrypted_message
  end

  def self.write_to_file
    file = File.open(self.output_file, "w")
    file.write(self.encrypt_the_message(self.input_file))
    file.write ("\n")
    file.write(@encryptor.key)
    file.write ("\n")
    file.write(@encryptor.date)
  end

  def self.print
    self.write_to_file
    puts "Created #{self.output_file} with the key #{@encryptor.key} and the date #{@encryptor.date}"
  end
end

Encrypt.print
