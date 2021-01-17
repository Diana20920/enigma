class Offset
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def calculate(date)
    offset_keys = [:a, :b, :c, :d]
    # look into Hash#transform_values for refactoring.
    date_array = ((date.to_i)**2).to_s.chars[-4..-1]
    offset_values = date_array.map do |value|
      value.to_i
    end
    Hash[offset_keys.zip offset_values]
  end
end
