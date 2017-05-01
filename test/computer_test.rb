require './test/test_helper.rb'
require './lib/computer.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_create_ship
    c = Computer.new
    actual = c.place_ship(2)
    expected = c.two_unit_ship
    assert_equal expected, actual
  end

  def test_create_second_ship
    c = Computer.new

    c.place_ship(2)
    actual = c.place_ship(3)
    expected = c.three_unit_ship
    assert_equal expected, actual
  end

end
