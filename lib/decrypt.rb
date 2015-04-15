require_relative 'decryptor'

class Decrypt

  def self.input_file
    ARGV[0]
  end

  def self.output_file
    ARGV[1]
  end

  def self.key
    raise ArgumentError, "I need a key to decrypt!" if ARGV[2] == nil
    ARGV[2]
  end

  def self.date
    raise ArgumentError, "I need to know the date that this message was encrypted!" if ARGV[3] == nil
    ARGV[3]
  end

  def self.message_to_decrypt(input_file = "encrypted.txt")
    file = File.open(input_file, "r")
    file.readline.chomp
  end

  def self.decrypt_the_message(input_file = "encrypted.txt")
    decryptor = Decryptor.new(self.message_to_decrypt(input_file), self.key, self.date)
    decryptor.decrypted_message
  end

  def self.write_to_file
    file = File.open(self.output_file, "w")
    file.write(self.decrypt_the_message(self.input_file))
  end
end

Decrypt.write_to_file

