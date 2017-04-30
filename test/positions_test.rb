require './test/test_helper.rb'
require './lib/positions.rb'

class PositionsTest < Minitest::Test

  def test_it_exists
    positions = Positions.new

    assert_instance_of Positions, positions
  end

  def test_valid_coordinates
    positions = Positions.new

    positions.combine_positions
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    actual = positions.valid_coordinates
    assert_equal expected, actual
  end

end
