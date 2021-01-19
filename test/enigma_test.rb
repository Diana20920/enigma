require './test/test_helper.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt_all_args_provided
    enigma = Enigma.new

    expected = {
                  encryption: "keder ohulw",
                  key:        "02715",
                  date:       "040895"
               }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_with_all_args_and_special_char
    enigma = Enigma.new

    expected = {
                  encryption: "keder ohulw!",
                  key:        "02715",
                  date:       "040895"
               }

    assert_equal expected, enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_encrypt_with_key_arg
    enigma         = Enigma.new
    generated_date = Offset.new.date

    expected = {
                  encryption: "nkfaufqdxry",
                  key:        "02715",
                  date:       generated_date # "180121"
               }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_only_message_arg
    skip # find how to use mocks/stubs to have it pass based on changing output.
    enigma         = Enigma.new
    generated_key  = Key.new.number
    generated_date = Offset.new.date

    expected = {
                  encryption: "qipgxd j ph",
                  key:        generated_key,   # "32548"
                  date:       generated_date   # "180121"
               }
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_decrypt_with_key_and_date
    enigma = Enigma.new

    expected = {
                  decryption: "hello world",
                  key:        "02715",
                  date:       "040895"
               }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  #### for CLI #####
  def test_decrypt_cli_and_caps
    enigma = Enigma.new

    expected = {
                  decryption: "waarcwlufht",
                  key:        "82648",
                  date:       "240818"
               }
    assert_equal expected, enigma.decrypt("fampMwxsphE", "82648", "240818")
  end
  #### end for CLI ####

  def test_decrypt_with_special_char
    enigma = Enigma.new

    expected = {
                  decryption: "hello world!",
                  key:        "02715",
                  date:       "040895"
               }
    assert_equal expected, enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_decrypt_with_only_key_arg
    enigma         = Enigma.new
    generated_date = Offset.new.date
    encrypted      = {encryption: "nkfaufqdxry"}

    expected = {
                  decryption: "hello world",
                  key:        "02715",
                  date:       generated_date # "180121"
               }
    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
  end
end
