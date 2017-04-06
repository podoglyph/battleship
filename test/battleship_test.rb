require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship.rb'

class BattleshipTest < Minitest::Test

  def test_battleship_ship_exists
    b = Battleship.new

    assert_equal Battleship, b.class
  end

  def test_battleship_can_deploy_computer_ships
    b = Battleship.new

    a_ship = b.computer.two_unit_ship
    assert_equal Ship, a_ship.class
  end

  def test_ship_can_read_its_destination
    skip
    b = Battleship.new

    assert b.deploy_location
  end



end
