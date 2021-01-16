require 'date'

class Enigma
  attr_reader :message,
              :key,
              :date

  def initialize#(components)
    # @message = components[:message] # this will likely become the file we are given to encryt
    # @key = components[key: (0..9).to_a.sample(5).join]
    # @date = components[date: Time.now.strftime("%d%m%Y")]
  end

  def encrypt(message, key, date)
    expected_hash = {}
    character_set = ("a".."z").to_a << " "
    shift_a = 3
    shift_b = 27
    shift_c = 73
    shift_d = 20
    to_encrypt = message.chars.each_slice(4).to_a

    new_string = to_encrypt.map do |array_of_4|
      if character_set.include?(array_of_4[0])
        character_set.index(array_of_4[0]) + shift_a
      elsif character_set.include?(array_of_4[1])
        character_set.index(array_of_4[1]) + shift_b
      elsif character_set.include?(array_of_4[2])
        character_set.index(array_of_4[2]) + shift_c
      elsif character_set.include?(array_of_4[3])
        character_set.index(array_of_4[3]) + shift_d
      end
    end
    new_string
  end

  def shifts
    nums = (0..9).to_a
    shifts_hash = Hash.new(0)


  end
end
