require './test/test_helper.rb'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_optional_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt_all_args_provided
    enigma = Enigma.new
    # encrypt a message with a key and date
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_with_key_arg
    enigma = Enigma.new
    # encrypt a message with a key (uses today's date)

    expected = {
                  encryption: "hello world",
                  key: "02715",
                  date: mock(String)}
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_only_message_arg
    enigma = Enigma.new
    # encrypt a message (generates random key and uses today's date)
    expected = {
                  encryption: "hello world",
                  key: mock(String),
                  date: mock(String)}
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_get_shifts
    skip
    enigma = Enigma.new

    expected = {
                  A: 3,
                  B: 27,
                  C: 73,
                  D: 20
               }

    assert_equal expected, enigma.shifts
  end

  def test_it_can_read_file
    enigma = Enigma.new


  end
end
