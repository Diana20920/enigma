require './test/test_helper.rb'

class KeyTest < Minitest::Test
  def test_it_exists
    keys = Key.new("02715")

    assert_instance_of Key, keys
    assert_equal "02715", keys.number
  end

  def test_create_four_sub_keys
    keys = Key.new("02715")

    expected = {
                a: 02,
                b: 27,
                c: 71,
                d: 15
              }

    assert_equal expected, keys.calculate_key("02715")
  end

  def test_it_can_generate_random_5_digit_key
    keys = Key.new

    assert_equal 5, keys.number.length
  end
end
