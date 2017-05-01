require './test/test_helper.rb'
require './lib/player.rb'

class PlayerTest < Minitest::Test

  def test_class_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_ship_placement
    player = Player.new
    input1 = "A1 A2"
    input2 = "C1 C2 C3"
    input1 = input1.split(" ")
    input2 = input2.split(" ")
    player.place_ships(input1, 2)
    player.place_ships(input2, 3)

    assert_equal player.two_unit_ship, input1
    assert_equal player.three_unit_ship, input2
  end
end
