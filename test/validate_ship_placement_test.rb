require './lib/validate_ship_placement.rb'
require 'minitest/autorun'
require 'minitest/pride'

class ValidateShipPlacementTest < Minitest::Test

  def test_class_exists
    v = ValidateShipPlacement

    assert_equal ValidateShipPlacement, v
  end

  def test_can_receive_return_value_from_validate_on_map
    v = ValidateShipPlacement
    vm = ValidateOnMap.parse_coordinates("A1, B1", 2)

    assert_equal true, vm

    vm1 = ValidateOnMap.parse_coordinates("A1, B6", 2)
    assert_equal false, vm1
  end

end
