require './test/test_helper.rb'

class ShiftTest < Minitest::Test
  def test_it_exists_and_has_optional_attributes
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_get_shifts
    enigma = Enigma.new

    expected = {
                  A: 3,
                  B: 27,
                  C: 73,
                  D: 20
               }

    assert_equal expected, enigma.shifts
  end
end
