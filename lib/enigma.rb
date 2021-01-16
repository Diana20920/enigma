require 'date'

class Enigma

  def encrypt(message, key, date)
    expected_hash = {}
    character_set = ("a".."z").to_a << " "

    array_message = message.chars
    array_message.map.with_index do |letter, index|
      if character_set.include?(letter)
        character_set.rindex(letter) # up to here, I get an array of the indeces corresponding to the message.
      end
    end
  end


end
