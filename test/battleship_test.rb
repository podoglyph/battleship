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
    assert_nil b.user_input

    b.welcome_message
    refute_nil b.user_input
  end

  
end
