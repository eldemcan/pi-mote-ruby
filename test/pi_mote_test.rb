require "test_helper"

class PiMoteTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PiMote::VERSION
  end
end
