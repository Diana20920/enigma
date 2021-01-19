require './test/test_helper.rb'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    offsets = Offset.new("040895")

    assert_instance_of Offset, offsets
    assert_equal "040895", offsets.date
  end

  def test_create_four_offsets_numbers
    offsets = Offset.new("040895")

    expected = {
                a: 1,
                b: 0,
                c: 2,
                d: 5
              }
    assert_equal expected, offsets.calculate_offset("040895")
  end

  def test_it_can_generate_random_6_digit_date
    offsets = Offset.new

    assert_equal 6, offsets.date.length
  end
end
