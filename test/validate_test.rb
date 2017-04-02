require 'minitest/autorun'
require 'minitest/pride'
require './lib/validate.rb'
require './lib/battleship.rb'

class ValidateTest < Minitest::Test

  def test_class_exists
    b = Battleship.new

    assert_equal true, Validate.valid
  end
end
