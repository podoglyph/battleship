require './test/test_helper.rb'
require './lib/battleship.rb'

class BattleshipTest < Minitest::Test

  def test_battleship_ship_exists
    b = Battleship.new
    
    assert_equal Battleship, b.class
  end

end
