require 'minitest/autorun'
require 'minitest/pride'
require './lib/required_files.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_computer_can_place_ships
    c = Computer.new

    assert c.respond_to?(:place_ships)
  end

  def test_two_unit_ship_created
    c = Computer.new
    c.place_ships

    assert_equal 1, c.two_unit_ships
  end

  def test_three_unit_ship_created
    c = Computer.new
    c.place_ships

    assert_equal 1, c.three_unit_ships
  end

end
