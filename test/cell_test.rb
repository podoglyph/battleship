require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell.rb'

class CellTest < Minitest::Test

  def test_class_exists
    c = Cell.new

    assert_equal Cell, c.class
  end

  def test_attributes_are_readeable
    c = Cell.new

    assert_equal false, c.has_ship
    assert_equal 0, c.hit_count
  end

end
