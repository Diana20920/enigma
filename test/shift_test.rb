require './test/test_helper.rb'

class ShiftTest < Minitest::Test
  def test_it_exists
    shift = Shift.new("02715", "040895")

    assert_instance_of Shift, shift
    # assert_equal "02715", shift.key
    # assert_equal "040895", shift.offset
  end

  def test_get_shifts
    skip
    shift = Shift.new("02715", "040895")

    expected = {
                  a: 3,
                  b: 27,
                  c: 73,
                  d: 20
               }
    assert_equal expected, shift.calculate("02715", "040895")
  end
end
