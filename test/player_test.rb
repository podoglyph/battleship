require './test/test_helper.rb'
require './lib/player.rb'

class PlayerTest < Minitest::Test

  def test_map_validation
    p = Player.new

    expected = true
    actual = p.place_ships("A1 A2")

    assert_equal expected, actual

    expected = false
    actual = p.place_ships("A9 A2")
    assert_equal expected, actual
  end

end
