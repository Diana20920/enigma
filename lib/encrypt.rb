require_relative 'enigma.rb'
# this ~works. Need to actually implement it to know for sure.
class FileInput

  def read
    handle = File.open(ARGV[0], 'r')
    given_file = handle.read
    handle.close
  end
end

class FileOutput
  attr_reader :reader

  def initialize
    @reader = Enigma.new(:encrypt)
  end

  def write(text)
    new_message = File.open(encrypted.txt, 'w')
    new_message.write(text)
    new_message.close
  end
end
# below is a work in progress becuase it does not yet take the second file.

# ruby ./lib/encrypt.rb message.txt encrypted.txt

# encrypted = given_file.encrypt(given_file)

# writer = File.open(ARGV[1], 'w')
# writer.write(encrypted)
# writer.close

puts "Created 'encrypted.txt' with the key 82648 and date 240818"
