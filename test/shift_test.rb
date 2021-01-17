require './test/test_helper.rb'

class ShiftTest < Minitest::Test
  def test_it_exists_and_has_optional_attributes
    shift = Shift.new

    assert_instance_of Shift, shift
  end
end
