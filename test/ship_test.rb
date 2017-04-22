require './lib/test_helper.rb'
require './lib/ship.rb'

class ShipTest < Minitest::Test

  def test_class_exists
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")

    assert_equal Ship, s.class
  end

  def test_ship_can_access_grid_class
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert_equal Grid, g.class
  end

  def test_ship_can_access_the_grid
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert g.game_grid
  end

  def test_ship_can_access_a_cell
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert_equal 4, g.game_grid[0].length
  end

  def test_ship_can_access_cell_attributes
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert_equal false, g.game_grid[0][0].has_ship
  end

  def test_ship_can_alter_a_cell
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert_equal true, g.game_grid[0][0].has_ship = true
  end

  def test_ship_can_find_cell_coordinates
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    g = Grid.new

    assert_equal true, g.game_grid[0][0].x == 0
    assert_equal true, g.game_grid[1][0].x == 1
  end

  def test_deploy_ship_method_can_access_cells
    skip
    s = Ship.new([[0,0], [0,1], [0,2]], 2, "Computer")
    grid = Grid.new
    ds = s.deploy_ship

    assert Game.game_grid
  end
end
