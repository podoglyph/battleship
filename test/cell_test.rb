require './test/test_helper.rb'
require './lib/cell.rb'

class CellTest < Minitest::Test

  def test_class_exists
    c = Cell.new(0, 1)

    assert_equal Cell, c.class
  end

  def test_attributes_are_readable
    c = Cell.new(0, 1)

    assert_equal false, c.has_ship
    assert_equal "", c.fired_upon
  end

  def test_cell_can_have_ship
    c = Cell.new(0, 1)

    assert_equal false, c.has_ship

    c.has_ship = true

    assert_equal true, c.has_ship
  end

  def test_cell_can_take_a_hit
    c = Cell.new(0, 1)
    c.fired_upon = "h"

    assert_equal "h", c.fired_upon
  end

  def test_can_pass_arguments_into_cell_on_creation
    c = Cell.new(0, 1)

    assert_equal 0, c.x
    assert_equal 1, c.y
  end

end
