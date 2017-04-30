require './test/test_helper.rb'
require './lib/computer.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_create_ship
    c = Computer.new
    actual = c.get_valid_next_position
    expected = c.two_unit_ship
    assert_equal expected, actual
  end

  def test_mark_ship_on_grid
    c = Computer.new

    c.get_valid_next_position
    c.two_unit_ship

  end

end
