require_relative 'key'

class Shift
  attr_reader :key,
              :offset

  def initialize(key = Key.new, offset = Offset.new)
    @key    = key
    @offset = offset
  end

  def calculate(key, offset)
    shifts_hash = Hash.new

    require "pry"; binding.pry
  end
end
