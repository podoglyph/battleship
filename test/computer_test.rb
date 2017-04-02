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

    assert_nil c.place_ships
  end
end
