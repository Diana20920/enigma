class Shift
  def initialize(key, date)
    @key = nil
    @date = nil
  end

  def shifts(key, date)
    if key.nil?
      nums = (0..9).to_a
      key = nums.sample(5).join
    elsif
      key.length == 5
    elsif key.length != 5
      nums = (0..9).to_a
      key = nums.sample(5).join
      if date.nil?
        date = Time.now.strftime("%d%m%Y")
      elsif
        date.length == 6
      elsif key.length != 6
        date = Time.now.strftime("%d%m%Y")
      end
    end
  end
end
