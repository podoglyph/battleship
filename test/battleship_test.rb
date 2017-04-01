require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship.rb'

class BattleshipTest < Minitest::Test

  def test_battleship_ship_exists
    b = Battleship.new

    assert_equal Battleship, b.class
  end

  def test_user_input_receipt
    b = Battleship.new
    b.get_user_input

    assert_equal true, b.validate_responses(user_input)
  end
end
