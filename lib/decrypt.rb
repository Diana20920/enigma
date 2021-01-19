require_relative 'enigma'
require_relative 'key'
require_relative 'offset'

in_file = File.open(ARGV[0], 'r')
to_decrypt = File.read(in_file)

decipher = Enigma.new
apply_decipher = decipher.decrypt(to_decrypt, ARGV[2], ARGV[3])

out_file = File.open(ARGV[1], 'w')
out_file.write(apply_decipher[:decryption])

p "Created #{ARGV[1]} with the key #{apply_decipher[:key]} and date #{apply_decipher[:date]}"
in_file.close
out_file.close
