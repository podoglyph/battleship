require './test/test_helper.rb'
require './lib/computer.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_place_two_unit_ship
    c = Computer.new
    position = c.place_ships(2)
    first_unit = position.first.has_ship
    second_unit = position.last.has_ship

    assert_equal 2, position.length
    assert_equal true, first_unit
    assert_equal true, second_unit
  end

  def test_place_three_unit_ship
    c = Computer.new
    position = c.place_ships(3)
    first_unit = position.first
    second_unit = position[1]
    third_unit = position.last

    assert_equal 3, position.length
    assert_equal Cell, first_unit.class
    assert_equal Cell, second_unit.class
    assert_equal Cell, third_unit.class
  end

  # def test_placements_of_multiple_ships
  #   c = Computer.new
  #   c.place_ships(2)
  #   c.place_ships(3)
  #
  #   assert_instance_of Array, c.two_unit_ship
  #   assert_equal Array, c.three_unit_ship.last
  # end

end
