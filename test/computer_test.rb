require './test/test_helper.rb'
require './lib/computer.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end

  def test_extract_cell_coordinates
    c = Computer.new

    expected = 2
    position = c.place_ships(2)
    assert_equal expected, position.length
  end

end
