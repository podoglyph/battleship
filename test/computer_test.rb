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
    first_unit = position.first.has_ship
    second_unit = position[1].has_ship
    third_unit = position.last.has_ship

    assert_equal 3, position.length
    assert_equal true, first_unit
    assert_equal true, second_unit
    assert_equal true, third_unit
  end

  def test_placements_of_multiple_ships
    c = Computer.new
    position1 = c.place_ships(2)
    position2 = c.place_ships(3)
    
    assert_equal c.two_unit_ship, position1
    assert_equal c.three_unit_ship, position2
  end

end
