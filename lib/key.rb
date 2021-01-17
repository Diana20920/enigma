class Key
  attr_reader :number

  def initialize(number = (0..9).to_a.sample(5).join)
    @number = number
  end

  def calculate_key(number)
    hash_keys = [:a, :b, :c, :d]

    hash_values_raw = number.chars.each_cons(2).to_a
    values = hash_values_raw.map do |pair|
      pair.join.to_i
    end

    Hash[hash_keys.zip values]
  end
end
