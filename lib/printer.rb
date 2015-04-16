class Printer

  def self.input_file
    ARGV[0]
  end

  def self.output_file
    ARGV[1]
  end

  def self.retrieve_message(input_file)
    file = File.open(input_file, "r")
    file.readline.chomp
  end

  def self.get_ready_to_write(output_file)
    if File.exists?(output_file)
      self.confirm_overwrite
    else
      File.open(output_file, "w")
    end
  end

  def self.confirm_overwrite
    puts "Your output file already exists. Are you sure you want to run? (y/n)"
    input = $stdin.gets.chomp
    if input == "y"
      File.open(output_file, "w")
    else
      abort("Your file will not be changed.")
    end
  end

  def self.incorrect_num_arguments_encrypt
    abort("Wrong number of arguments. Should be:\n   > message.txt encrypted.txt")
  end

  def self.incorrect_num_arguments_decrypt
    abort("Wrong number of arguments. Should be:\n   > encrypted.txt decrypted.txt key date(ddmmyy)")
  end

  def self.incorrect_num_arguments_crack
    abort("Wrong number of arguments. Should be:\n   > encrypted.txt cracked.txt date(mmddyy)")
  end

end
