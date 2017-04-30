require './test/test_helper.rb'
require './lib/computer.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_first_position
    c = Computer.new

    positions = c.computer_grid.locations
    actual = c.get_first_position
    expected = positions.any? { |e| e == actual  }
    assert expected
  end

  def test_create_ship
    c = Computer.new

    actual = c.get_valid_next_position
    expected = c.two_unit_ship
    
    assert_equal expected, actual
  end

end
