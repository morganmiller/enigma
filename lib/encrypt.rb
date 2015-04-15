require_relative 'encryptor'

class Encrypt

  #take message.txt
  #output encrypted text
  #use randomly generated key and date

  #edge_case = make sure not nil
  #use class methods, not initialize
  #are instance variables storing information about the state?
     #if not, not instance vars

  def self.input_file
    ARGV[0]
  end

  def self.output_file
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

end

Encrypt.write_to_file

