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

  def test_place_ships_increments_unit_ships
    skip
    c = Computer.new

    assert_equal "The computer has placed its ships.", c.place_ships
  end


end
