require './test/test_helper.rb'
require './lib/validate_ship_placement.rb'
require './lib/grid.rb'

class ValidateShipPlacementTest < Minitest::Test

  def test_class_exists
    v = ValidateShipPlacement.new("A1 B1", 2)

    assert_equal ValidateShipPlacement, v.class
  end

  def test_choose_first_position
    
  end

end
