require_relative 'enigma'
require_relative 'key'
require_relative 'offset'

in_file = File.open(ARGV[0], 'r')
to_encrypt = File.read(in_file)

cipher = Enigma.new
apply_cipher = cipher.encrypt(to_encrypt)

out_file = File.open(ARGV[1], 'w')
out_file.write(apply_cipher[:encryption])

p "Created #{ARGV[1]} with the key #{cipher.key.number} and date #{cipher.date.date}"
in_file.close
out_file.close
