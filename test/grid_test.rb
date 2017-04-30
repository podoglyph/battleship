require './test/test_helper.rb'
require './lib/grid.rb'

class GridTest < Minitest::Test

  def test_grid_class_exists
    g = Grid.new

    assert_equal Grid, g.class
  end

  def test_grid_is_created
    g = Grid.new

    assert_equal 16, g.game_grid.length
  end

  def test_create_cells_creates_cells
    g = Grid.new

    refute_nil g.game_grid[0]
  end

end
