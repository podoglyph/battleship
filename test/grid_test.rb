require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid.rb'

class GridTest < Minitest::Test

  def test_battleship_ship_exists
    g = Grid.new

    assert_equal Grid, g.class
  end


end
