require_relative 'enigma'
require_relative 'key'
require_relative 'offset'

in_file = File.open(ARGV[0], 'r')
to_encrypt = File.read(in_file)

cipher = Enigma.new#(to_encrypt)
cipher.encrypt(to_encrypt)

out_file = File.open(ARGV[1], 'w')
# out_file.encrypt(in_file)

p "Created #{ARGV[0]} with the key #{cipher.key.number} and date #{cipher.date.date}"
in_file.close
out_file.close

# the interpolated sections are not working.
