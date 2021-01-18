require './test/test_helper.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
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
    skip
    enigma = Enigma.new
    # encrypt a message with a key (uses today's date)
    generated_date = Offset.new
     # generated_date.stubs(:calculate_offset).with(generated_date).returns(String)
    expected = {
                  encryption: "hello world",
                  key: "02715",
                  date: generated_date.date}
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_only_message_arg
    skip
    enigma = Enigma.new
    # encrypt a message (generates random key and uses today's date)
    expected = {
                  encryption: "hello world",
                  key: mock(String),
                  date: mock(String)}
    assert_equal expected, enigma.encrypt("hello world")
  end
end
