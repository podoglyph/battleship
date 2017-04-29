require './test/test_helper.rb'
require './lib/positions.rb'

class PositionsTest < Minitest::Test

  def test_it_exists
    positions = Positions.new

    assert_instance_of Positions, positions
  end

  def test_valid_coordinates
    positions = Positions.new

    letters = positions.letters
    numbers = positions.numbers
    positions.combine_positions(letters, numbers)

    expected = ["A1", "B2", "C3", "D4"]
    actual = positions.valid_coordinates

    assert_equal expected, actual
  end

end
