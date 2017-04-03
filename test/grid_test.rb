require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid.rb'

class GridTest < Minitest::Test

  def test_grid_class_exists
    g = Grid.new

    assert_equal Grid, g.class
  end

  def test_grid_is_created
    g = Grid.new

    assert_equal 4, g.game_grid.length
  end

  def test_create_cells_creates_cells
    g = Grid.new

    refute_nil g.game_grid[0][0]
  end

  def test_cells_in_grid_are_unique
    g = Grid.new

    refute_equal g.game_grid[0][0], g.game_grid[0][1]
    refute_equal g.game_grid[1][0], g.game_grid[0][1]
    refute_equal g.game_grid[2][0], g.game_grid[3][1]
    refute_equal g.game_grid[3][2], g.game_grid[2][1]
  end

  def test_cell_locations_are_accurate
    g = Grid.new
    c = g.game_grid[0][0]
    c1 = g.game_grid[1][1]

    assert_instance_of Cell, c
    assert_equal 1, c.x
    assert_equal 1, c.y
    assert_equal 2, c1.x
    assert_equal 2, c1.y
  end


end
