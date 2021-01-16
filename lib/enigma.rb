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
    # expected_hash = Hash.new("")
    character_set = ("a".."z").to_a << " "
    shift_a = 3
    shift_b = 27
    shift_c = 73
    shift_d = 20
    to_encrypt = message.chars.each_slice(4).to_a
    new_string = []

    to_encrypt.map do |array_of_4|
      if character_set.include?(array_of_4[0])
        index_a = character_set.index(array_of_4[0])
        new_ind_a = (index_a + shift_a).modulo(27)
        new_string << character_set[new_ind_a]
        if character_set.include?(array_of_4[1])
          index_b = character_set.index(array_of_4[1])
          new_ind_b = (index_b + shift_b).modulo(27)
          new_string << character_set[new_ind_b]
          if character_set.include?(array_of_4[2])
            index_c = character_set.index(array_of_4[2])
            new_ind_c = (index_c + shift_c).modulo(27)
            new_string << character_set[new_ind_c]
            if character_set.include?(array_of_4[3])
              index_d = character_set.index(array_of_4[3])
              new_ind_d = (index_d + shift_d).modulo(27)
              new_string << character_set[new_ind_d]
      # elsif
        # p "condition goes here"
            end
          end
        end
      end
    end
    {
      encryption: new_string.join,
      key:        key,
      date:       date
   }
  end

  def shifts
    nums = (0..9).to_a
    shifts_hash = Hash.new(0)
    

  end
end
