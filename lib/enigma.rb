require 'date'
require_relative 'key'
require_relative 'offset'

class Enigma
  attr_reader :message,
              :key,
              :date

  def initialize
    @message = message
    @key     = Key.new
    @date    = Offset.new
  end

  def encrypt(message, key = @key.number, date = @date.date)
    character_set = ("a".."z").to_a << " "

    hash1 = @key.calculate_key(key)
    hash2 = @date.calculate_offset(date)
    shifts_hash = hash1.merge(hash2) do |hkeys, value1, value2|
      value1 + value2
    end

    shift_a = shifts_hash[:a]
    shift_b = shifts_hash[:b]
    shift_c = shifts_hash[:c]
    shift_d = shifts_hash[:d]

    to_encrypt = message.downcase.chars.each_slice(4).to_a
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
            else
              array_of_4.each do |letter|
                if !character_set.include?(letter)
                  index = letter.index(letter)
                    new_string << letter[index]
                end
              end
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

  def decrypt(cyphertext, key, date = @date.date)
    character_set = ("a".."z").to_a << " "

    hash1 = @key.calculate_key(key)
    hash2 = @date.calculate_offset(date)
    shifts_hash = hash1.merge(hash2) do |hkeys, value1, value2|
      value1 + value2
    end

    shift_a = shifts_hash[:a]
    shift_b = shifts_hash[:b]
    shift_c = shifts_hash[:c]
    shift_d = shifts_hash[:d]

    to_decrypt = cyphertext.downcase.chars.each_slice(4).to_a
    new_string = []

    to_decrypt.map do |array_of_4|
      if character_set.include?(array_of_4[0])
        index_a = character_set.index(array_of_4[0])
        new_ind_a = (index_a - shift_a).modulo(27)
        new_string << character_set[new_ind_a]
        if character_set.include?(array_of_4[1])
          index_b = character_set.index(array_of_4[1])
          new_ind_b = (index_b - shift_b).modulo(27)
          new_string << character_set[new_ind_b]
          if character_set.include?(array_of_4[2])
            index_c = character_set.index(array_of_4[2])
            new_ind_c = (index_c - shift_c).modulo(27)
            new_string << character_set[new_ind_c]
            if character_set.include?(array_of_4[3])
              index_d = character_set.index(array_of_4[3])
              new_ind_d = (index_d - shift_d).modulo(27)
              new_string << character_set[new_ind_d]
            else
              array_of_4.each do |letter|
                if !character_set.include?(letter)
                  index = letter.index(letter)
                    new_string << letter[index]
                end
              end
            end
          end
        end
      end
    end
    {
      decryption: new_string.join,
      key:        key,
      date:       date
   }
  end
end
